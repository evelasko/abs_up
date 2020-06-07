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
  String group;
  @HiveField(9)
  @override
  int tag;
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

  @override
  Future<void> setFavorite() async {
    tag = 1;
    await save();
  }

  @override
  Future<void> setBlacklist() async {
    tag = 2;
    await save();
  }

  @override
  Future<void> removeTag() async {
    tag = 0;
    await save();
  }

  @override
  bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise) =>
      maybeAnExercise.containsKey(EXERCISE_NAME_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_DIFFICULTY_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_INTENSITY_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_TARGET_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_EQUIPMENT_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_WEIGHTED_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_SIDED_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_IMPACT_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_DESCRIPTION_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_MEDIA_KEY) &&
      maybeAnExercise.containsKey(EXERCISE_THUMB_KEY);

  @override
  Exercise exerciseFromMap(Map<String, dynamic> exerciseMap) => Exercise(
      name: exerciseMap[EXERCISE_NAME_KEY] as String,
      difficulty: exerciseMap[EXERCISE_DIFFICULTY_KEY] as int,
      intensity: exerciseMap[EXERCISE_INTENSITY_KEY] as int,
      target: exerciseMap[EXERCISE_TARGET_KEY] as String,
      equipment: exerciseMap[EXERCISE_EQUIPMENT_KEY] as String,
      weighted: exerciseMap[EXERCISE_WEIGHTED_KEY] as bool,
      sided: exerciseMap[EXERCISE_SIDED_KEY] as bool,
      impact: exerciseMap[EXERCISE_IMPACT_KEY] as bool,
      group: exerciseMap[EXERCISE_GROUP_KEY] as String,
      description: exerciseMap[EXERCISE_DESCRIPTION_KEY] as String ?? '',
      media: exerciseMap[EXERCISE_MEDIA_KEY] as String ?? '',
      thumb: exerciseMap[EXERCISE_THUMB_KEY] as String ?? '');

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Exercise &&
        o.name == name &&
        o.difficulty == difficulty &&
        o.intensity == intensity &&
        o.target == target &&
        o.equipment == equipment &&
        o.weighted == weighted &&
        o.sided == sided &&
        o.media == media &&
        o.thumb == thumb &&
        o.description == description;
  }

  @override
  int get hashCode => name.hashCode;
}
