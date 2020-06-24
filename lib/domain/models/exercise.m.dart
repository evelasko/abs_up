import 'package:flutter/material.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

abstract class ExerciseModel {
  final String name;
  final int difficulty;
  final int intensity;
  final String target;
  final String equipment;
  final bool weighted;
  final bool sided;
  final bool impact;
  final String group;
  final int tag;
  final String description;
  final String media;
  final String thumb;

  ExerciseModel(
    this.name,
    this.difficulty,
    this.intensity,
    this.target,
    this.equipment,
    this.weighted,
    this.sided,
    this.impact,
    this.description,
    this.media,
    this.thumb,
    this.group,
    this.tag,
  );

  /// Retrieve the icon for the exercise quipment
  IconData get equipmentIcon;

  /// Returns the string for the exercise's intensity value
  String get intensityString;

  /// Returns the string for the exercise's difficulty value
  String get difficultyString;

  /// Returns true if the provided map has all the exercise model's required fields
  static bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise) => true;

  /// Returns an exercise from a map
  static ExerciseModel fromMap(Map<String, dynamic> exerciseMap) => null;

  /// Duplicates an exercise with the given fields modified
  ExerciseModel copyWith({
    String name,
    int difficulty,
    int intensity,
    String target,
    String equipment,
    bool weighted,
    bool sided,
    bool impact,
    String description,
    String media,
    String thumb,
    String group,
    int tag,
  });
}
