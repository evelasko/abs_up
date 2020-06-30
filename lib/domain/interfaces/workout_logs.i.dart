import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:flutter/foundation.dart';

abstract class WorkoutLogsInterface {
  /// Returns all workout log entries
  List<WorkoutLog> get userLogs;

  /// Saves a new workout log entry for a given performed workout
  Future<void> saveNewWorkoutLogEntry(
      {@required List<WorkoutItem> items, @required String sourceWorkoutKey});
}
