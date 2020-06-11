/// Route Links
const String HOME_LINK = 'home';
const String EXERCISES_LIST_LINK = 'exercises';
const String EXERCISE_DETAILS_LINK = 'exercise/details/';
const String EXERCISE_ADD_TO_LINK = 'exercise/addto/';
const String WORKOUT_LIST_LINK = 'workout/list';
const String WORKOUT_DETAILS_LINK = 'workout/details/';
const String WORKOUT_ITEM_DETAILS_LINK = 'workout/item/';
const String WORKOUT_PERFORM_LINK = 'workout/perform/';
const String WORKOUT_LOGS_LINK = 'workout/logs';
const String SETTINGS_LINK = 'settings';
const String FEEDBACK_LINK = 'feedback';
const String SUPPORT_LINK = 'support';
const String EXTERNAL_WEB_LINK = 'web/';

/// Web Links
const String PRIVACY_POLICY_WWW_LINK = 'https://misfitcoders.com/privacy';
const String PROJECT_PAGE_WWW_LINK = 'https://misfitcoders.com';

/// Hive Box Names
const String EXERCISE_BOX_NAME = 'exercises';
const String USER_SETTINGS_BOX_NAME = 'user_settings';
const String WORKOUT_SETTINGS_BOX_NAME = 'workout_settings';
const String WORKOUTS_BOX_NAME = 'workouts';
const String WORKOUT_LOGS_BOX_NAME = 'workout_logs';

/// Keys
//=
//= User settings keys
const String USER_ID_KEY = 'userId';
const String FIRST_NAME_KEY = 'firstName';
const String LAST_NAME_KEY = 'lastName';
const String PRESENTATION_WATCHED_KEY = 'presentationWatched';
const String PROGRESS_START_DATE_KEY = 'progressStartDate';
const String WEIGHT_MEASURE_KEY = 'weightMeasure';
const String WORKOUT_SETTINGS_KEY = 'workoutSettings';
const String FAVORITE_EXERCISES_KEY = 'favoriteExercises';
const String BLACKLIST_EXERCISES_KEY = 'blacklistExercises';

//=
//= Settings and exercise detail keys
const String LENGTH_KEY = 'length';
const String INTENSITY_KEY = 'intensity';
const String DIFFICULTY_KEY = 'difficulty';
const String IMPACT_KEY = 'impact';
const String EQUIPMENT_KEY = 'equipment';

//=
//= Workout keys
const String CURRENT_WORKOUT_KEY = 'currentWorkout';

//=
//= Equipment keys
const String EQUIPMENT_NONE_KEY = 'none';
const String EQUIPMENT_DUMBBELL_KEY = 'dumbbell';
const String EQUIPMENT_BARBELL_KEY = 'barbell';
const String EQUIPMENT_PHYSIO_BALL_KEY = 'physio ball';
const String EQUIPMENT_SMALL_BALL_KEY = 'small ball';
const String EQUIPMENT_CABLE_KEY = 'cable';
const String EQUIPMENT_ELASTIC_BAND_KEY = 'elastic band';
const String EQUIPMENT_HUNGING_BAR_KEY = 'hanging bar';
const String EQUIPMENT_PARTNER_KEY = 'partner';

const List<String> EQUIPMENT_DATA_KEYS = [
  EQUIPMENT_NONE_KEY,
  EQUIPMENT_DUMBBELL_KEY,
  EQUIPMENT_BARBELL_KEY,
  EQUIPMENT_PHYSIO_BALL_KEY,
  EQUIPMENT_SMALL_BALL_KEY,
  EQUIPMENT_CABLE_KEY,
  EQUIPMENT_ELASTIC_BAND_KEY,
  EQUIPMENT_HUNGING_BAR_KEY,
  EQUIPMENT_PARTNER_KEY,
];

const Map<String, String> EQUIPMENT_TEXT = {
  EQUIPMENT_NONE_KEY: 'None',
  EQUIPMENT_DUMBBELL_KEY: 'Dumbbell',
  EQUIPMENT_BARBELL_KEY: 'Barbell',
  EQUIPMENT_PHYSIO_BALL_KEY: 'Physio Ball',
  EQUIPMENT_SMALL_BALL_KEY: 'Small Ball',
  EQUIPMENT_CABLE_KEY: 'Cable',
  EQUIPMENT_ELASTIC_BAND_KEY: 'Elastic Band',
  EQUIPMENT_HUNGING_BAR_KEY: 'Hanging Bar',
  EQUIPMENT_PARTNER_KEY: 'Partner'
};

//= Exercise keys
const String EXERCISE_NAME_KEY = 'name';
const String EXERCISE_WEIGHTED_KEY = 'weighted';
const String EXERCISE_SIDED_KEY = 'sided';
const String EXERCISE_TARGET_KEY = 'target';
const String EXERCISE_GROUP_KEY = 'group';
const String EXERCISE_DIFFICULTY_KEY = DIFFICULTY_KEY;
const String EXERCISE_INTENSITY_KEY = INTENSITY_KEY;
const String EXERCISE_EQUIPMENT_KEY = EQUIPMENT_KEY;
const String EXERCISE_IMPACT_KEY = IMPACT_KEY;
const String EXERCISE_DESCRIPTION_KEY = 'description';
const String EXERCISE_MEDIA_KEY = 'media';
const String EXERCISE_THUMB_KEY = 'thumb';

/// Workout Settings Default Values
const int INTENSITY_DEFAULT = 1;
const int DIFFICULTY_DEFAULT = 1;
const int LENGTH_DEFAULT = 1;
const bool IMPACT_DEFAULT = false;
const String EQUIPMENT_DEFAULT = EQUIPMENT_NONE_KEY;

/// Default  workout settings map
const Map<String, dynamic> WORKOUT_SETTINGS_DEFAULTS_MAP = {
  LENGTH_KEY: LENGTH_DEFAULT,
  INTENSITY_KEY: INTENSITY_DEFAULT,
  DIFFICULTY_KEY: DIFFICULTY_DEFAULT,
  IMPACT_KEY: IMPACT_DEFAULT,
  EQUIPMENT_KEY: [EQUIPMENT_DEFAULT]
};

/// Workout Generator Values
//= Minimum duration for each length
const int MINIMUM_DURATION_SHORT_LENGTH = 360;
const int MINIMUM_DURATION_MEDIUM_LENGTH = 660;
const int MINIMUM_DURATION_LONG_LENGTH = 900;
const int MINIMUM_DURATION_DEFAULT = 420;

//= Workout items durations
const int WORKOUT_ITEM_DURATION_SHORT = 30;
const int WORKOUT_ITEM_DURATION_MEDIUM = 43;
const int WORKOUT_ITEM_DURATION_LONG = 60;

/// Shared Data Values
const List<String> LENGTH_STRINGS = ['Short', 'Medium', 'Long'];
const List<String> INTENSITY_STRINGS = ['Low', 'Moderate', 'High', 'Extreme'];
const List<String> DIFFICULTY_STRINGS = ['Beginner', 'Advanced', 'Expert'];

String intensityToString(int intValue,
        {int defaultValue = INTENSITY_DEFAULT}) =>
    INTENSITY_STRINGS[
        intValue >= 1 && intValue <= 4 ? intValue - 1 : defaultValue];

int intensityToInt(String strValue) =>
    INTENSITY_STRINGS.indexOf(strValue) + 1 ?? INTENSITY_DEFAULT;

String difficultyToString(int intValue,
        {int defaultValue = DIFFICULTY_DEFAULT}) =>
    DIFFICULTY_STRINGS[
        intValue >= 1 && intValue <= 3 ? intValue - 1 : defaultValue];

int difficultyToInt(String strValue) =>
    DIFFICULTY_STRINGS.indexOf(strValue) + 1 ?? DIFFICULTY_DEFAULT;

String lengthToString(int intValue, {int defaultValue = LENGTH_DEFAULT}) =>
    LENGTH_STRINGS[
        intValue >= 1 && intValue <= 3 ? intValue - 1 : defaultValue];

int lengthToInt(String strValue) =>
    LENGTH_STRINGS.indexOf(strValue) + 1 ?? LENGTH_DEFAULT;

String impactToString(bool boolValue, {bool defaultValue = IMPACT_DEFAULT}) =>
    boolValue ? 'Include' : 'Ignore';
