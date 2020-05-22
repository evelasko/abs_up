abstract class UserSettingsInterace {
  /// User Settings initializer
  static Future<void> initUserSettings() async {}

  /// Workout settings
  Map<String, dynamic> get currentWorkoutSettings;

  // TODO the expression below should only set the default workout settings...
  Future<void> setWorkoutSettings();

  /// User data and settings
  String get userId;
  Future<void> setUserId(String userId);

  bool get presentationWatched;

  DateTime get progressStartDate;

  String get weightMeasure;
}
