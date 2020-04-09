import 'package:hive/hive.dart';

import '../models/exercise.dart';
import '../models/user_settings.dart';
import 'i_hive_facade.dart';

class IUserSettingsFacade {
  static Box userSettingsBox = IHiveFacade.userSettingsBox;
  static Box exercisesBox = IHiveFacade.exercisesBox;

  IUserSettingsFacade._();

  /// User data and settings
  String get userId =>
      userSettingsBox.get(UserSettings.userId, defaultValue: null);
  Future<void> setUserId(String userId) async =>
      await userSettingsBox.put(UserSettings.userId, userId);

  String get firstName =>
      userSettingsBox.get(UserSettings.firstName, defaultValue: null);

  String get lastName =>
      userSettingsBox.get(UserSettings.lastName, defaultValue: null);

  bool get presentationWatched => userSettingsBox
      .get(UserSettings.presentationWatched, defaultValue: false);
  Future<void> setPresentationWatched(bool watched) async =>
      await userSettingsBox.put(UserSettings.presentationWatched, watched);

  DateTime get progressStartDate => userSettingsBox
      .get(UserSettings.progressStartDate, defaultValue: DateTime.now());

  String get weightMeasure =>
      userSettingsBox.get(UserSettings.weightMeasure, defaultValue: 'kg');

  /// User favorite exercises
  List<String> _getFavoriteExercises() => userSettingsBox
      .get(UserSettings.favoriteExercises, defaultValue: []).cast<String>();

  List<String> get favoriteExercises => _getFavoriteExercises();

  static bool isFavorite(String exerciseId) =>
      IUserSettingsFacade._()._getFavoriteExercises().contains(exerciseId);

  static Future<void> addFavorite(String exerciseId) async {
    List<String> favorites = IUserSettingsFacade._()._getFavoriteExercises();
    if (favorites.contains(exerciseId)) return;
    favorites.add(exerciseId);
    await userSettingsBox.put(UserSettings.favoriteExercises, favorites);
  }

  static Future<void> removeFavorite(String exerciseId) async {
    List<String> favorites = IUserSettingsFacade._()._getFavoriteExercises();
    if (!favorites.contains(exerciseId)) return;
    favorites.remove(exerciseId);
    await userSettingsBox.put(UserSettings.favoriteExercises, favorites);
  }

  /// User blacklist exercises
  List<String> _getBlacklistExercises() => userSettingsBox
      .get(UserSettings.blacklistExercises, defaultValue: []).cast<String>();

  List<String> get blacklistExercises => _getBlacklistExercises();

  static bool isBlacklist(String exerciseId) =>
      IUserSettingsFacade._()._getBlacklistExercises().contains(exerciseId);

  static Future<void> addBlacklist(String exerciseId) async {
    List<String> blacklist = IUserSettingsFacade._()._getBlacklistExercises();
    if (blacklist.contains(exerciseId)) return;
    blacklist.add(exerciseId);
    await userSettingsBox.put(UserSettings.blacklistExercises, blacklist);
  }

  static Future<void> removeBlacklist(String exerciseId) async {
    List<String> blacklist = IUserSettingsFacade._()._getBlacklistExercises();
    if (!blacklist.contains(exerciseId)) return;
    blacklist.remove(exerciseId);
    await userSettingsBox.put(UserSettings.favoriteExercises, blacklist);
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
