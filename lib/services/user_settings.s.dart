import 'package:hive/hive.dart';

import '../constants.dart';
import '../domain/interfaces/user_settings.i.dart';
import 'p_data.s.dart';

class UserSettingsService implements UserSettingsInterace {
  static Box userSettingsBox = PDataService.userSettingsBox;
  static Box exercisesBox = PDataService.exercisesBox;

  // IUserSettingsFacade._();

  /// Settings initializer
  static Future<void> initUserSettings() async {
    if (userSettingsBox.isEmpty) {
      await userSettingsBox.put(
          WORKOUT_SETTINGS_KEY, WORKOUT_SETTINGS_DEFAULTS_MAP);
    }
  }

  @override
  Map<String, dynamic> get currentWorkoutSettings {
    return userSettingsBox.get(WORKOUT_SETTINGS_KEY) as Map<String, dynamic>;
  }

  // TODO the expression below should only set the default workout settings...
  @override
  Future<void> setWorkoutSettings() =>
      userSettingsBox.put(WORKOUT_SETTINGS_KEY, WORKOUT_SETTINGS_DEFAULTS_MAP);

  @override
  String get userId =>
      userSettingsBox.get(USER_ID_KEY, defaultValue: USER_ID_KEY) as String;
  @override
  Future<void> setUserId(String userId) =>
      userSettingsBox.put(USER_ID_KEY, userId);

  String get firstName =>
      userSettingsBox.get(FIRST_NAME_KEY, defaultValue: FIRST_NAME_KEY)
          as String;

  String get lastName =>
      userSettingsBox.get(LAST_NAME_KEY, defaultValue: LAST_NAME_KEY) as String;
  @override
  bool get presentationWatched =>
      userSettingsBox.get(PRESENTATION_WATCHED_KEY, defaultValue: false)
          as bool;
  Future<void> setPresentationWatched(bool watched) =>
      userSettingsBox.put(PRESENTATION_WATCHED_KEY, watched);
  @override
  DateTime get progressStartDate =>
      userSettingsBox.get(PROGRESS_START_DATE_KEY, defaultValue: DateTime.now())
          as DateTime;
  @override
  String get weightMeasure =>
      userSettingsBox.get(WEIGHT_MEASURE_KEY, defaultValue: 'kg') as String;
}
