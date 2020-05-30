import 'package:flutter/foundation.dart';

import '../models/workout.dart';
import '../models/workout_settings.dart';

abstract class WorkoutInterface {
  final Workout currentWorkout = Workout();

  final List<String> availableTargets = [
    'Core',
    'Lower',
    'Upper',
    'Rect',
    'Obliques',
    'Kegel'
  ];

  //: Getters _________________________________________________
  /// Returns the current workout settings
  WorkoutSettings get workoutSettings;

  ValueListenable get workoutsListenable;
  List<Workout> get allWorkouts;

  /// Returns a rough amount exercises to include by the length set in settings
  int get roughtExerciseAmount;

  //: Methods _________________________________________________

  /// defaultWorkout initializer
  Future<void> initWorkoutSettings();

  /// Generates a new workout based on current settings
  Workout generateWorkout();

  /// Generates a new workout based on current settings
  /// and saves it into the currentWorkout key of the workouts box
  Future<void> generateCurrentWorkout();

  /// Saves the current generated workout with the given name
  Future<void> saveCurrentWorkoutAs(String name);

  /// * to deprecate
  /// Create a ne workout log entry with the current workout
  Future<void> saveNewWorkoutLogEntry();
}
