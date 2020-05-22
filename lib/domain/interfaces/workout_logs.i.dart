abstract class WorkoutLogsInterface {
  /// Saves a new workout log entry for a given performed workout
  Future<void> saveNewWorkoutLogEntry();

  /// Generates a new workout log entry to perform.
  /// If no workout is specified it uses the workout at currentWorkout.
  Future<String> performWorkout({String workoutKey});
}
