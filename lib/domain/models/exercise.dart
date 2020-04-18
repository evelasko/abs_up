import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/presentation/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'exercise.g.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

@HiveType(typeId: 1, adapterName: 'ExerciseAdapter')
class Exercise extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int difficulty;
  @HiveField(2)
  final int intensity;
  @HiveField(3)
  final String target;
  @HiveField(4)
  final String equipment;
  @HiveField(5)
  final bool weighted;
  @HiveField(6)
  final bool sided;
  @HiveField(7)
  final bool impact;
  @HiveField(8)
  final String group;
  @HiveField(9)
  int tag;

  Exercise(
      {this.impact,
      this.group,
      this.name,
      this.difficulty,
      this.intensity,
      this.target,
      this.equipment,
      this.weighted,
      this.sided,
      this.tag = 0});

  /// Exercise value getters
  IconData get equipmentIcon =>
      AbsAppIcons.equipment[equipment.toLowerCase()] ??
      AbsAppIcons.logo_outline;

  String get intensityString => DataValues.intensityToString(intensity);
  String get difficultyString => DataValues.difficultyToString(difficulty);

  Future<void> setFavorite() async {
    this.tag = 1;
    await this.save();
  }

  Future<void> setBlacklist() async {
    this.tag = 2;
    await this.save();
  }

  Future<void> removeTag() async {
    this.tag = 0;
    await this.save();
  }

  /// Comparison checker
  bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise) =>
      maybeAnExercise.containsKey(DataValues.exerciseNameKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseDifficultyKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseIntensityKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseTargetKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseEquipmentKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseWeightedKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseSidedKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseImpactKey) &&
      maybeAnExercise.containsKey(DataValues.exerciseGroupKey);

  /// Exercise methods
  Exercise exerciseFromMap(Map<String, dynamic> exerciseMap) => Exercise(
      name: exerciseMap[DataValues.exerciseNameKey],
      difficulty: exerciseMap[DataValues.exerciseDifficultyKey],
      intensity: exerciseMap[DataValues.exerciseIntensityKey],
      target: exerciseMap[DataValues.exerciseTargetKey],
      equipment: exerciseMap[DataValues.exerciseEquipmentKey],
      weighted: exerciseMap[DataValues.exerciseWeightedKey],
      sided: exerciseMap[DataValues.exerciseSidedKey],
      impact: exerciseMap[DataValues.exerciseImpactKey],
      group: exerciseMap[DataValues.exerciseGroupKey]);

  /// Class overrides
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
        o.sided == sided;
  }

  @override
  int get hashCode => name.hashCode;
}
