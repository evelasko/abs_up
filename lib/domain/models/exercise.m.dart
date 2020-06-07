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
  String group;
  int tag;
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
  );

  /// Retrieve the icon for the exercise quipment
  IconData get equipmentIcon;

  /// Returns the string for the exercise's intensity value
  String get intensityString;

  /// Returns the string for the exercise's difficulty value
  String get difficultyString;

  /// Tags the exercise as favorite and removes it from blacklist if present
  Future<void> setFavorite();

  /// Tags the exercise as blacklisted and removes it from favorites if pressent
  Future<void> setBlacklist();

  /// Tags the exercise as plain exercise
  Future<void> removeTag();

  /// Returns true if the provided map has all the exercise model's required fields
  bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise);

  /// Returns an exercise from a map
  ExerciseModel exerciseFromMap(Map<String, dynamic> exerciseMap);
}
