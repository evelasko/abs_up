import 'package:abs_up/domain/models/exercise.dart';
import 'package:flutter/foundation.dart';

abstract class ExerciseInterface {
  ValueListenable get exercisesListenable;
  List<Exercise> get allExercises;

  /// Fetch exercises from local JSON
  /// If there is no exercise stored in the device
  /// will fetch local json and save it in the device
  Future<void> fetchLocalExercises();

  /// Check for new exercises in remote endopint,
  /// retrieves and saves them in the device
  Future<void> updateExerciseList();
}
