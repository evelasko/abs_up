import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../presentation/theme/icons.t.dart';
import 'exercise.m.dart';

part 'exercise.g.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

@HiveType(typeId: 1, adapterName: 'ExerciseAdapter')
class Exercise extends HiveObject implements ExerciseModel {
  @override
  @HiveField(0)
  final String name;
  @HiveField(1)
  @override
  final int difficulty;
  @HiveField(2)
  @override
  final int intensity;
  @HiveField(3)
  @override
  final String target;
  @HiveField(4)
  @override
  final String equipment;
  @HiveField(5)
  @override
  final bool weighted;
  @HiveField(6)
  @override
  final bool sided;
  @HiveField(7)
  @override
  final bool impact;
  @HiveField(8)
  @override
  final String group;
  @HiveField(9)
  @override
  final int tag;
  @HiveField(10)
  @override
  final String description;
  @HiveField(11)
  @override
  final String media;
  @HiveField(12)
  @override
  final String thumb;

  Exercise(
      {this.description = '',
      this.media = '',
      this.thumb = '',
      this.impact,
      this.group = 'Free',
      this.name,
      this.difficulty,
      this.intensity,
      this.target,
      this.equipment,
      this.weighted,
      this.sided,
      this.tag = 0});

  @override
  IconData get equipmentIcon =>
      AbsAppIcons.equipment[equipment.toLowerCase()] ??
      AbsAppIcons.logo_outline;

  @override
  String get intensityString => intensityToString(intensity);
  @override
  String get difficultyString => difficultyToString(difficulty);

  static bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise) =>
      optionOf(maybeAnExercise).foldRight<bool>(
          false,
          (value, _) =>
              value.containsKey(EXERCISE_NAME_KEY) &&
              value.containsKey(EXERCISE_DIFFICULTY_KEY) &&
              value.containsKey(EXERCISE_INTENSITY_KEY) &&
              value.containsKey(EXERCISE_TARGET_KEY) &&
              value.containsKey(EXERCISE_EQUIPMENT_KEY) &&
              value.containsKey(EXERCISE_WEIGHTED_KEY) &&
              value.containsKey(EXERCISE_SIDED_KEY) &&
              value.containsKey(EXERCISE_IMPACT_KEY) &&
              value.containsKey(EXERCISE_DESCRIPTION_KEY) &&
              value.containsKey(EXERCISE_MEDIA_KEY) &&
              value.containsKey(EXERCISE_THUMB_KEY));

  // ignore: prefer_constructors_over_static_methods
  static Exercise fromMap(Map<String, dynamic> exerciseMap) =>
      optionOf(hasExerciseKeys(exerciseMap) ? exerciseMap : null)
          .foldRight<Exercise>(
              null,
              (value, previous) => hasExerciseKeys(exerciseMap)
                  ? Exercise(
                      name: exerciseMap[EXERCISE_NAME_KEY] as String,
                      difficulty: exerciseMap[EXERCISE_DIFFICULTY_KEY] as int,
                      intensity: exerciseMap[EXERCISE_INTENSITY_KEY] as int,
                      target: exerciseMap[EXERCISE_TARGET_KEY] as String,
                      equipment: exerciseMap[EXERCISE_EQUIPMENT_KEY] as String,
                      weighted: exerciseMap[EXERCISE_WEIGHTED_KEY] as bool,
                      sided: exerciseMap[EXERCISE_SIDED_KEY] as bool,
                      impact: exerciseMap[EXERCISE_IMPACT_KEY] as bool,
                      group: exerciseMap[EXERCISE_GROUP_KEY] as String,
                      description:
                          exerciseMap[EXERCISE_DESCRIPTION_KEY] as String ?? '',
                      media: exerciseMap[EXERCISE_MEDIA_KEY] as String ?? '',
                      thumb: exerciseMap[EXERCISE_THUMB_KEY] as String ?? '')
                  : previous);
  @override
  Exercise copyWith(
          {String description,
          String media,
          String thumb,
          bool impact,
          String group,
          String name,
          int difficulty,
          int intensity,
          String target,
          String equipment,
          bool weighted,
          bool sided,
          int tag}) =>
      Exercise(
        description: description ?? this.description,
        media: media ?? this.media,
        thumb: thumb ?? this.thumb,
        impact: impact ?? this.impact,
        group: group ?? this.group,
        name: name ?? this.name,
        difficulty: difficulty ?? this.difficulty,
        intensity: intensity ?? this.intensity,
        target: target ?? this.target,
        equipment: equipment ?? this.equipment,
        weighted: weighted ?? this.weighted,
        sided: sided ?? this.sided,
        tag: tag ?? this.tag,
      );

  // TODO add equatable to implement model equality
}
