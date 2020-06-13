import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart';
import '../domain/interfaces/workout_logs.i.dart';
import '../domain/models/workout_item.dart';
import 'p_data.s.dart';

class WorkoutLogsService implements WorkoutLogsInterface {
  final Uuid uuid = Uuid();
  final Box<Workout> workoutsBox = PDataService.workoutsBox;
  final Box<WorkoutLog> workoutLogsBox = PDataService.workoutLogsBox;

  @override
  Future<void> saveNewWorkoutLogEntry(
      {@required List<WorkoutItem> items,
      @required String sourceWorkoutKey}) async {
    final Workout workout = workoutsBox.get(sourceWorkoutKey);
    await workoutLogsBox.put(
        Uuid().v4(),
        WorkoutLog(
            items: [...items],
            sourceWorkoutName: workout.name ?? 'No name',
            sourceWorkoutId: workout.key.toString() ?? 'No key'));
  }

  @override
  Future<String> performWorkout({String workoutKey}) async {
    final String _workoutKey = workoutKey ?? CURRENT_WORKOUT_KEY;
    final currentWorkout = PDataService.workoutsBox.get(_workoutKey);
    final workoutToPerformKey = uuid.v4();
    await PDataService.workoutLogsBox.put(
        workoutToPerformKey,
        WorkoutLog(
          items: currentWorkout.items,
          sourceWorkoutId: currentWorkout.key.toString(),
          sourceWorkoutName: currentWorkout.name,
        ));
    return workoutToPerformKey;
  }

  Option<List<WorkoutLog>> get userLogs =>
      optionOf(workoutLogsBox.values.toList());
}
