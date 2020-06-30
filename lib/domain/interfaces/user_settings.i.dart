import 'package:abs_up/domain/models/equipment.dart';

import '../models/workout_settings.dart';

abstract class UserSettingsInterface {
  /// Register listener for changes in workout settings
  void registerWorkoutSettingsListener(void Function() listener);

  /// Get current workout settings
  WorkoutSettings get workoutSettings;

  /// Reset workout settings to defaults
  Future<void> resetWorkoutSettings();

  /// Change intensity of workout settings
  Future<void> intensitySetAndSave(String newValue);

  /// Change difficulty of workout settings
  Future<void> difficultySetAndSave(String newValue);

  /// Change length of workout settings
  Future<void> lengthSetAndSave(String newValue);

  /// Change or toggle current impact value of workout settings
  Future<void> impactSetOrToggleAndSave(bool newValue);

  /// Add equipment to workout settings
  Future<void> addEquipment({String key, Equipment equipment});

  /// Remove equipment from workout settings
  Future<void> removeEquipment({String key, Equipment equipment});

  /// Set current workout settings to defaults
  Future<void> setWorkoutSettings(WorkoutSettings settings);
}
