import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:hive/hive.dart';

import '../models/exercise.dart';
import '../models/workout_settings.dart';
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
    return userSettingsBox.get(DataValues.workoutSettingsKey);
  }

  // TODO the expression below should only set the default workout settings...
  Future<void> setWorkoutSettings() async => await userSettingsBox.put(
      DataValues.workoutSettingsKey, WorkoutSettings.defaultSettingsMap);

  /// User data and settings
  String get userId => userSettingsBox.get(DataValues.userIdKey,
      defaultValue: DataValues.userIdKey);
  Future<void> setUserId(String userId) async =>
      await userSettingsBox.put(DataValues.userIdKey, userId);

  String get firstName => userSettingsBox.get(DataValues.firstNameKey,
      defaultValue: DataValues.firstNameKey);

  String get lastName => userSettingsBox.get(DataValues.lastNameKey,
      defaultValue: DataValues.lastNameKey);

  bool get presentationWatched => userSettingsBox
      .get(DataValues.presentationWatchedKey, defaultValue: false);
  Future<void> setPresentationWatched(bool watched) async =>
      await userSettingsBox.put(DataValues.presentationWatchedKey, watched);

  DateTime get progressStartDate => userSettingsBox
      .get(DataValues.progressStartDateKey, defaultValue: DateTime.now());

  String get weightMeasure =>
      userSettingsBox.get(DataValues.weightMeasureKey, defaultValue: 'kg');
}
