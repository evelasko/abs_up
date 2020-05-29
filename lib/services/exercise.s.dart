import 'dart:convert';

import 'package:abs_up/domain/interfaces/exercise.i.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExerciseService implements ExerciseInterface {
  final Box<Exercise> exercisesBox = PDataService.exercisesBox;
  final CollectionReference exercisesCollection =
      Firestore.instance.collection('exercises');

  @override
  ValueListenable<Box<Exercise>> get exercisesListenable =>
      exercisesBox.listenable();

  @override
  Future<void> fetchLocalExercises() async {
    final Map<String, dynamic> localExercises = jsonDecode(await rootBundle
            .loadString("assets/data/exercises.json", cache: false))
        as Map<String, dynamic>;
    if (exercisesBox.isOpen && exercisesBox.isEmpty) {
      localExercises.forEach((key, value) async => Exercise()
              .hasExerciseKeys(value as Map<String, dynamic>)
          ? await exercisesBox.put(
              key, Exercise().exerciseFromMap(value as Map<String, dynamic>))
          : null);
    }
  }

  @override
  Future<void> updateExerciseList() async {}

  @override
  List<Exercise> get allExercises => exercisesBox.values
      .where((exercise) => !exercise.name.contains(RegExp('Rest')))
      .toList();
}
