abstract class ExerciseInterface {
  /// Fetch exercises from local JSON
  /// If there is no exercise stored in the device
  /// will fetch local json and save it in the device
  Future<void> fetchLocalExercises();

  /// Check for new exercises in remote endopint,
  /// retrieves and saves them in the device
  Future<void> updateExerciseList();
}
