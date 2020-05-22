import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart';
import '../domain/interfaces/workout_logs.i.dart';
import '../domain/models/workout_item.dart';
import 'p_data.s.dart';

class WorkoutLogsService implements WorkoutLogsInterface {
  final Uuid uuid = Uuid();

  @override
  Future<void> saveNewWorkoutLogEntry(
      {@required List<WorkoutItem> items,
      @required String sourceWorkout}) async {
    return;
  }

  @override
  Future<String> performWorkout({String workoutKey}) async {
    final String _workoutKey = workoutKey ?? CURRENT_WORKOUT_KEY;
    final currentWorkout = PDataService.workoutsBox.get(_workoutKey);
    final workoutToPerformKey = uuid.v4();
    await PDataService.workoutLogsBox
        .put(workoutToPerformKey, currentWorkout.copy());
    return workoutToPerformKey;
  }
}
