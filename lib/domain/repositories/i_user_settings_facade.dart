import 'package:hive/hive.dart';

import '../models/workout_settings.dart';
import 'data_values.dart';
import 'i_hive_facade.dart';

class IUserSettingsFacade {
  static Box userSettingsBox = IHiveFacade.userSettingsBox;
  static Box exercisesBox = IHiveFacade.exercisesBox;

  IUserSettingsFacade._();

  /// Settings initializer
  static Future<void> initUserSettings() async {
    if (userSettingsBox.isEmpty) {
      await userSettingsBox.put(
          DataValues.workoutSettingsKey, WorkoutSettings.defaultSettingsMap);
    }
  }

  /// Workout settings
  Map<String, dynamic> get currentWorkoutSettings {
    return userSettingsBox.get(DataValues.workoutSettingsKey)
        as Map<String, dynamic>;
  }

  // TODO the expression below should only set the default workout settings...
  Future<void> setWorkoutSettings() => userSettingsBox.put(
      DataValues.workoutSettingsKey, WorkoutSettings.defaultSettingsMap);

  /// User data and settings
  String get userId => userSettingsBox.get(DataValues.userIdKey,
      defaultValue: DataValues.userIdKey) as String;
  Future<void> setUserId(String userId) =>
      userSettingsBox.put(DataValues.userIdKey, userId);

  String get firstName => userSettingsBox.get(DataValues.firstNameKey,
      defaultValue: DataValues.firstNameKey) as String;

  String get lastName => userSettingsBox.get(DataValues.lastNameKey,
      defaultValue: DataValues.lastNameKey) as String;

  bool get presentationWatched => userSettingsBox
      .get(DataValues.presentationWatchedKey, defaultValue: false) as bool;
  Future<void> setPresentationWatched(bool watched) =>
      userSettingsBox.put(DataValues.presentationWatchedKey, watched);

  DateTime get progressStartDate =>
      userSettingsBox.get(DataValues.progressStartDateKey,
          defaultValue: DateTime.now()) as DateTime;

  String get weightMeasure =>
      userSettingsBox.get(DataValues.weightMeasureKey, defaultValue: 'kg')
          as String;
}
