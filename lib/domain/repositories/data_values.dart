class DataValues {
  /// Route Links
  static const String homeLink = 'home';
  static const String exercisesListLink = 'exercises';
  static const String exerciseDetailsLink = 'exercise/details/';
  static const String workoutListLink = 'workout/list';
  static const String workoutDetailsLink = 'workout/details/';
  static const String workoutPerformLink = 'workout/perform/';
  static const String workoutLogsLink = 'workout/logs';
  static const String settingsLink = 'settings';
  static const String aboutLink = 'about';
  static const String feedbackLink = 'feedback';
  static const String supportLink = 'support';

  /// Hive Box Names
  static const String exerciseBoxName = 'exercises';
  static const String userSettingsBoxName = 'user_settings';
  static const String workoutSettingsBoxName = 'workout_settings';
  static const String workoutsBoxName = 'workouts';
  static const String workoutLogsBoxName = 'workout_logs';

  /// Keys
  //=
  //= User settings keys
  static const String userIdKey = 'userId';
  static const String firstNameKey = 'firstName';
  static const String lastNameKey = 'lastName';
  static const String presentationWatchedKey = 'presentationWatched';
  static const String progressStartDateKey = 'progressStartDate';
  static const String weightMeasureKey = 'weightMeasure';
  static const String workoutSettingsKey = 'workoutSettings';
  static const String favoriteExercisesKey = 'favoriteExercises';
  static const String blacklistExercisesKey = 'blacklistExercises';

  //=
  //= Settings and exercise detail keys
  static const String lengthKey = 'length';
  static const String intensityKey = 'intensity';
  static const String difficultyKey = 'difficulty';
  static const String impactKey = 'impact';
  static const String equipmentKey = 'equipment';

  //=
  //= Workout keys
  static const String currentWorkoutKey = 'currentWorkout';

  //=
  //= Equipment keys
  static const String equipmentNoneKey = 'none';
  static const String equipmentDumbbellKey = 'dumbbell';
  static const String equipmentBarbellKey = 'barbell';
  static const String equipmentPhysioBallKey = 'physio ball';
  static const String equipmentSmallBallKey = 'small ball';
  static const String equipmentCableKey = 'cable';
  static const String equipmentElasticBandKey = 'elastic band';
  static const String equipmentHungingBarKey = 'hunging bar';
  static const String equipmentPartnerKey = 'partner';

  static const List<String> equipmentDataKeys = [
    equipmentNoneKey,
    equipmentDumbbellKey,
    equipmentBarbellKey,
    equipmentPhysioBallKey,
    equipmentSmallBallKey,
    equipmentCableKey,
    equipmentElasticBandKey,
    equipmentHungingBarKey,
    equipmentPartnerKey
  ];

  static const Map<String, String> equipmentText = {
    equipmentNoneKey: 'None',
    equipmentDumbbellKey: 'Dumbbell',
    equipmentBarbellKey: 'Barbell',
    equipmentPhysioBallKey: 'Physio Ball',
    equipmentSmallBallKey: 'Small Ball',
    equipmentCableKey: 'Cable',
    equipmentElasticBandKey: 'Elastic Band',
    equipmentHungingBarKey: 'Hunging Bar',
    equipmentPartnerKey: 'Partner'
  };

  //= Exercise keys
  static const String exerciseNameKey = 'name';
  static const String exerciseWeightedKey = 'weighted';
  static const String exerciseSidedKey = 'sided';
  static const String exerciseTargetKey = 'target';
  static const String exerciseGroupKey = 'group';
  static const String exerciseDifficultyKey = difficultyKey;
  static const String exerciseIntensityKey = intensityKey;
  static const String exerciseEquipmentKey = equipmentKey;
  static const String exerciseImpactKey = impactKey;

  /// Workout Settings Default Values
  static const int intensityDefault = 1;
  static const int difficultyDefault = 1;
  static const int lengthDefault = 1;
  static const bool impactDefault = false;
  static const String equipmentDefault = equipmentNoneKey;

  /// Workout Generator Values
  //= Minimum duration for each length
  static const int minimumDurationShortLength = 360;
  static const int minimumDurationMediumLength = 660;
  static const int minimumDurationLongLength = 900;
  static const int minimumDurationDefault = 420;

  //= Workout items durations
  static const int workoutItemDurationShort = 30;
  static const int workoutItemDurationMedium = 43;
  static const int workoutItemDurationLong = 60;

  /// Shared Data Values
  static List<String> lengthStrings = ['Short', 'Medium', 'Long'];
  static List<String> intensityStrings = ['Low', 'Moderate', 'High', 'Extreme'];
  static List<String> difficultyStrings = ['Beginner', 'Advanced', 'Expert'];

  static String intensityToString(int intValue,
          {int defaultValue = intensityDefault}) =>
      intensityStrings[
          intValue >= 1 && intValue <= 4 ? intValue - 1 : defaultValue];

  static int intensityToInt(String strValue) =>
      intensityStrings.indexOf(strValue) + 1 ?? intensityDefault;

  static String difficultyToString(int intValue,
          {int defaultValue = difficultyDefault}) =>
      difficultyStrings[
          intValue >= 1 && intValue <= 3 ? intValue - 1 : defaultValue];

  static int difficultyToInt(String strValue) =>
      difficultyStrings.indexOf(strValue) + 1 ?? difficultyDefault;

  static String lengthToString(int intValue,
          {int defaultValue = lengthDefault}) =>
      lengthStrings[
          intValue >= 1 && intValue <= 3 ? intValue - 1 : defaultValue];

  static int lengthToInt(String strValue) =>
      lengthStrings.indexOf(strValue) + 1 ?? lengthDefault;

  static String impactToString(bool boolValue,
          {bool defaultValue = impactDefault}) =>
      boolValue ? 'Include' : 'Ignore';
}
