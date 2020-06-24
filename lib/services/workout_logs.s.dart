import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart';
import '../domain/interfaces/workout_logs.i.dart';
import '../domain/models/workout_item.dart';
import '../domain/models/workout_log.dart';

@singleton
@RegisterAs(WorkoutLogsInterface)
class WorkoutLogsService implements WorkoutLogsInterface {
  @factoryMethod
  static Future<WorkoutLogsService> init() async {
    // Hive.registerAdapter<WorkoutLog>(WorkoutLogAdapter());
    // await Hive.openBox<WorkoutLog>(WORKOUT_LOGS_BOX_NAME);

    final singleton = WorkoutLogsService();
    return singleton;
  }

  Box<WorkoutLog> get _workoutLogsBox => Hive.box(WORKOUT_LOGS_BOX_NAME);

  @override
  List<WorkoutLog> get userLogs => _workoutLogsBox.values.toList();

  @override
  Future<void> saveNewWorkoutLogEntry(
      {@required List<WorkoutItem> items,
      @required String sourceWorkoutKey}) async {
    await _workoutLogsBox.put(Uuid().v4(),
        WorkoutLog(items: [...items], sourceWorkoutId: sourceWorkoutKey));
  }
}
