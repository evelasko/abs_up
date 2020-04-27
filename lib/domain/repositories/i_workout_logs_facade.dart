import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/models/workout_item.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

final Box<Workout> workoutsBox = IHiveFacade.workoutsBox;
final Box<Exercise> exercisesBox = IHiveFacade.exercisesBox;
final Box<Workout> workoutLogsBox = IHiveFacade.workoutLogsBox;
final Uuid uuid = Uuid();

Future<void> saveNewWorkoutLogEntry(
    {@required List<WorkoutItem> items, @required String sourceWorkout}) async {
  return;
}

/// Generates a new workout log entry to perform.
/// If no workout is specified it uses the workout at currentWorkout.
Future<String> performWorkout({String workoutKey}) async {
  final String _workoutKey = workoutKey ?? DataValues.currentWorkoutKey;
  final currentWorkout = workoutsBox.get(_workoutKey);
  final workoutToPerformKey = uuid.v4();
  await workoutLogsBox.put(workoutToPerformKey, currentWorkout.copy());
  return workoutToPerformKey;
}
