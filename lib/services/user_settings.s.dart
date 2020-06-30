import 'package:abs_up/domain/models/equipment.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';
import '../domain/interfaces/user_settings.i.dart';
import '../domain/models/workout_settings.dart';

@singleton
@RegisterAs(UserSettingsInterface)
class UserSettingsService implements UserSettingsInterface {
  final Box<WorkoutSettings> workoutSettingsBox;

  UserSettingsService(this.workoutSettingsBox);

  @factoryMethod
  static Future<UserSettingsService> init(
      Box<WorkoutSettings> workoutSettingsBox) async {
    final singleton = UserSettingsService(workoutSettingsBox);
    if (singleton.workoutSettingsBox.isEmpty) {
      await singleton.resetWorkoutSettings();
    }
    return singleton;
  }

  // Box get userSettingsBox => Hive.box(USER_SETTINGS_BOX_NAME);

  @override
  WorkoutSettings get workoutSettings => workoutSettingsBox.get(
        WORKOUT_SETTINGS_KEY,
        defaultValue: WorkoutSettings(),
      );

  @override
  void registerWorkoutSettingsListener(void Function() listener) =>
      workoutSettingsBox.listenable().addListener(listener);

  // void registerUserSettingsListener(void Function() listener) =>
  //     userSettingsBox.listenable().addListener(listener);

  @override
  Future<void> resetWorkoutSettings() async => workoutSettingsBox.put(
        WORKOUT_SETTINGS_KEY,
        WorkoutSettings(),
      );

  @override
  Future<void> setWorkoutSettings(WorkoutSettings settings) async =>
      workoutSettingsBox.put(
        WORKOUT_SETTINGS_KEY,
        settings ?? WorkoutSettings(),
      );
  @override
  Future<void> intensitySetAndSave(String newValue) async => setWorkoutSettings(
      workoutSettings.copyWith(intensity: intensityToInt(newValue)));
  @override
  Future<void> difficultySetAndSave(String newValue) async =>
      setWorkoutSettings(
          workoutSettings.copyWith(difficulty: difficultyToInt(newValue)));
  @override
  Future<void> lengthSetAndSave(String newValue) async => setWorkoutSettings(
      workoutSettings.copyWith(length: lengthToInt(newValue)));
  @override
  Future<void> impactSetOrToggleAndSave(bool newValue) async =>
      setWorkoutSettings(workoutSettings.copyWith(
          impact: newValue ?? !workoutSettings.impact));
  @override
  Future<void> addEquipment({String key, Equipment equipment}) async =>
      setWorkoutSettings(workoutSettings.copyWith(
          equipment:
              {...workoutSettings.equipment, key ?? equipment?.key}.toList()));
  @override
  Future<void> removeEquipment({String key, Equipment equipment}) async =>
      setWorkoutSettings(workoutSettings.copyWith(
          equipment: [...workoutSettings.equipment]
            ..remove(key ?? equipment?.key)));
}
