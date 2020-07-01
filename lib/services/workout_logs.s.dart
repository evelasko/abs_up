import 'package:abs_up/domain/models/perform_item.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../domain/interfaces/workout_logs.i.dart';
import '../domain/models/workout_log.dart';

@singleton
@RegisterAs(WorkoutLogsInterface)
class WorkoutLogsService implements WorkoutLogsInterface {
  final Box<WorkoutLog> workoutLogsBox;

  WorkoutLogsService(this.workoutLogsBox);

  @override
  List<WorkoutLog> get userLogs => workoutLogsBox.values.toList();

  @override
  Future<void> saveNewWorkoutLogEntry(
      {@required List<PerformItem> items,
      @required String sourceWorkoutKey}) async {
    await workoutLogsBox.put(Uuid().v4(),
        WorkoutLog(items: [...items], sourceWorkoutId: sourceWorkoutKey));
  }
}
