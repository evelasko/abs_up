import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../models/exercise.dart';

abstract class ExerciseInterface {
  /// Get all exercises in local storage
  List<Exercise> get allExercises;

  /// Register listener for changes in exercises list
  void registerListener(void Function() listener);

  /// Return the exercises from local JSON
  Future<Either<CoreFailure<String>, Map<String, Exercise>>>
      fetchLocalExercises();

  /// Saves an exercise for the given key with validity checks
  Future<Either<CoreFailure<String>, String>> saveNewExercise(
      String key, Exercise exercise);

  /// Saves an exercise for the given key
  Future<void> setExercise(String exerciseKey, Exercise exercise);

  /// Retrieves the exercise for the given key
  Exercise exerciseFromKey(String exerciseKey);

  /// Tags the exercise as favorite and removes it from blacklist if present
  Future<void> setFavorite(String exerciseKey);

  /// Tags the exercise as blacklisted and removes it from favorites if pressent
  Future<void> setBlacklist(String exerciseKey);

  /// Tags the exercise as plain exercise
  Future<void> removeTag(String exerciseKey);
}
