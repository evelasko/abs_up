import 'package:flutter/material.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

abstract class ExerciseModel {
  /// Retrieve the icon for the exercise quipment
  IconData get equipmentIcon;

  /// Returns the string for the exercise's intensity
  String get intensityString;

  /// Returns the string for the exercise's difficulty
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
