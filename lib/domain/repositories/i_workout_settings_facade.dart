import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:hive/hive.dart';

import 'i_hive_facade.dart';

class IWorkoutSettingsFacade {
  static Box workoutSettingsBox = IHiveFacade.workoutSettingsBox;

  static Future<void> initWorkoutSettings() async {
    if (workoutSettingsBox.containsKey(DataValues.workoutSettingsKey)) return;

    await workoutSettingsBox.put(
        DataValues.workoutSettingsKey, WorkoutSettings());
  }
}
