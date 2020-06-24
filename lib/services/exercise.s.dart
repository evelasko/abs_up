import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';
import '../domain/core/failures.dart';
import '../domain/interfaces/exercise.i.dart';
import '../domain/models/exercise.dart';

@singleton
@RegisterAs(ExerciseInterface)
class ExerciseService implements ExerciseInterface {
  @factoryMethod
  static Future<ExerciseService> init() async {
    final singleton = ExerciseService();

    //= initialize exercises
    if (singleton._exercisesBox.isEmpty) {
      //= fetch and save exercises from local JSON
      final Either<CoreFailure<String>, Map<String, Exercise>> localExercises =
          await singleton.fetchLocalExercises();
      await localExercises.foldRight(
        null,
        (exerciseMap, previous) async {
          exerciseMap.forEach((key, exercise) async {
            await singleton.saveNewExercise(key, exercise);
          });
        },
      );
    }
    return singleton;
  }

  Box<Exercise> get _exercisesBox => Hive.box<Exercise>(EXERCISE_BOX_NAME);

  @override
  List<Exercise> get allExercises => _exercisesBox.values.toList();

  @override
  void registerListener(void Function() listener) =>
      _exercisesBox.listenable().addListener(listener);

  @override
  Future<Either<CoreFailure<String>, Map<String, Exercise>>>
      fetchLocalExercises() async {
    try {
      final Map<String, dynamic> localExercises = jsonDecode(await rootBundle
              .loadString("assets/data/exercises.json", cache: false))
          as Map<String, dynamic>;
      return right(localExercises.map<String, Exercise>((key, value) =>
          MapEntry(key, Exercise.fromMap(value as Map<String, dynamic>))));
    } catch (e) {
      return left(CoreFailure<String>.internalError(message: e.toString()));
    }
  }

  @override
  Future<Either<CoreFailure<String>, String>> saveNewExercise(
      String key, Exercise exercise) async {
    if (key == null || exercise == null) {
      return left(const CoreFailure.internalError(
          message: 'The exercise provided to save is invalid'));
    }
    final List<String> exerciseKey = _exercisesBox.keys.toList().cast<String>();
    if (exerciseKey.contains(key)) {
      return left(const CoreFailure<String>.internalError(
          message: 'The key provided is already present in the local storage'));
    }
    await setExercise(key, exercise);
    return right(key);
  }

  @override
  Exercise exerciseFromKey(String exerciseKey) =>
      _exercisesBox.get(exerciseKey);

  @override
  Future<void> setExercise(String exerciseKey, Exercise exercise) async =>
      _exercisesBox.put(exerciseKey, exercise);

  @override
  Future<void> setFavorite(String exerciseKey) async =>
      setExercise(exerciseKey, exerciseFromKey(exerciseKey).copyWith(tag: 1));

  @override
  Future<void> setBlacklist(String exerciseKey) async =>
      setExercise(exerciseKey, exerciseFromKey(exerciseKey).copyWith(tag: 2));

  @override
  Future<void> removeTag(String exerciseKey) async =>
      setExercise(exerciseKey, exerciseFromKey(exerciseKey).copyWith(tag: 0));
}
