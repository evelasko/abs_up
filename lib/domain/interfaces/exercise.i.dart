import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class ExerciseInterface {
  /// Change nofitier for the loaded list of exercises
  ValueListenable get exercisesListenable;

  /// Retrieve all loaded exercises
  List<Exercise> get allExercises;

  /// Fetch exercises from local JSON asset file
  /// If there is no exercise already stored in the device
  /// will fetch local json and save it in the device
  Future<Either<CoreFailure<String>, Map<String, dynamic>>>
      fetchLocalExercises();

  /// Check for new exercises in remote endopint,
  /// retrieves and saves them in the device
  Future<void> updateExerciseList();
}
