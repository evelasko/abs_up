import 'package:flutter/foundation.dart';

import '../../constants.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import '../models/workout_settings.dart';

abstract class WorkoutInterface {
  final List<String> availableTargets = [
    'Core',
    'Lower',
    'Upper',
    'Rect',
    'Obliques',
    'Kegel'
  ];

  /// Get all stored workouts
  List<Workout> get allWorkouts;

  /// Get all user's workouts
  List<Workout> get allUserWorkouts;

  /// Fetches a workout by its key, if key is null or the workout was not found
  /// it will return the default workout object stored at CURRENT_WORKOUT_KEY
  Workout getWorkout([String key = CURRENT_WORKOUT_KEY]);

  /// Register listener for changes in workouts
  void registerListener(void Function() listener);

  /// Saves a workout to the given key. If no key is provided it uses CURRENT_WORKOUT_KEY
  Future<void> saveWorkout({
    String key = CURRENT_WORKOUT_KEY,
    @required Workout workout,
  });

  /// Duplicates the workout at CURRENT_WORKOUT_KEY with the given name into a new key
  Future<String> saveCurrentWorkoutAs(String name);

  /// Deletes a saved workout
  Future<void> deleteWorkout(String workoutKey);

  /// Generate a new workout with provided exercises and workout settings
  Workout generateWorkout(
    List<Exercise> exercises,
    WorkoutSettings settings,
  );

  /// Filter exercises base on current workout settings
  List<Exercise> getAvailableExercises(
    List<Exercise> exercises,
    WorkoutSettings settings,
  );
}
