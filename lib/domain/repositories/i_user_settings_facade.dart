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

  /// User favorite exercises
  List<String> _getFavoriteExercises() => userSettingsBox
      .get(DataValues.favoriteExercisesKey, defaultValue: []).cast<String>();

  List<String> get favoriteExercises => _getFavoriteExercises();

  static bool isFavorite(String exerciseId) =>
      IUserSettingsFacade._()._getFavoriteExercises().contains(exerciseId);

  static Future<void> addFavorite(String exerciseId) async {
    List<String> favorites = IUserSettingsFacade._()._getFavoriteExercises();
    if (favorites.contains(exerciseId)) return;
    favorites.add(exerciseId);
    await userSettingsBox.put(DataValues.favoriteExercisesKey, favorites);
  }

  static Future<void> removeFavorite(String exerciseId) async {
    List<String> favorites = IUserSettingsFacade._()._getFavoriteExercises();
    if (!favorites.contains(exerciseId)) return;
    favorites.remove(exerciseId);
    await userSettingsBox.put(DataValues.favoriteExercisesKey, favorites);
  }

  /// User blacklist exercises
  List<String> _getBlacklistExercises() => userSettingsBox
      .get(DataValues.blacklistExercisesKey, defaultValue: []).cast<String>();

  List<String> get blacklistExercises => _getBlacklistExercises();

  static bool isBlacklist(String exerciseId) =>
      IUserSettingsFacade._()._getBlacklistExercises().contains(exerciseId);

  static Future<void> addBlacklist(String exerciseId) async {
    List<String> blacklist = IUserSettingsFacade._()._getBlacklistExercises();
    if (blacklist.contains(exerciseId)) return;
    blacklist.add(exerciseId);
    await userSettingsBox.put(DataValues.blacklistExercisesKey, blacklist);
  }

  static Future<void> removeBlacklist(String exerciseId) async {
    List<String> blacklist = IUserSettingsFacade._()._getBlacklistExercises();
    if (!blacklist.contains(exerciseId)) return;
    blacklist.remove(exerciseId);
    await userSettingsBox.put(DataValues.favoriteExercisesKey, blacklist);
  }

  /// Common methods
  static ExerciseTag getExerciseTag(String exerciseId) {
    if (isFavorite(exerciseId))
      return ExerciseTag.favorited;
    else if (isBlacklist(exerciseId))
      return ExerciseTag.blacklisted;
    else
      return ExerciseTag.exercise;
  }

  /// User's Workout Settings
  // String get workoutSettingsLength => userSettingsBox.get(UserSettings.workoutSettingsLength, defaultValue: 'short');
  // int get workoutSettingsIntensity => userSettingsBox.get(UserSettings.workoutSettingsIntensity, defaultValue: 1);
  // int get workoutSettingsDifficulty => userSettingsBox.get(UserSettings.workoutSettingsDifficulty, defaultValue: 1);
  // List<String> get workoutSettingsEquipment => userSettingsBox.get(UserSettings.workoutSettingsEquipment, defaultValue: []);

}
