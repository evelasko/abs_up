import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../domain/models/exercise.dart';
import '../domain/models/workout.dart';
import '../domain/models/workout_item.dart';
import '../domain/models/workout_settings.dart';

class PDataService {
  static final PDataService _instance = PDataService._internal();
  factory PDataService() => _instance;
  PDataService._internal();

  /// Hive Boxes
  static final Box<Exercise> exercisesBox =
      Hive.box<Exercise>(EXERCISE_BOX_NAME);
  static final Box userSettingsBox = Hive.box(USER_SETTINGS_BOX_NAME);
  static final Box<WorkoutSettings> workoutSettingsBox =
      Hive.box<WorkoutSettings>(WORKOUT_SETTINGS_BOX_NAME);
  static final Box<Workout> workoutsBox = Hive.box(WORKOUTS_BOX_NAME);
  static final Box<WorkoutLog> workoutLogsBox = Hive.box(WORKOUT_LOGS_BOX_NAME);

  /// General methods
  static Future<void> initHive() async {
    final documentsDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    /// Init Hive
    Hive.init(documentsDirectory.path);
    Hive.registerAdapter<Exercise>(ExerciseAdapter());
    Hive.registerAdapter<WorkoutSettings>(WorkoutSettingsAdapter());
    Hive.registerAdapter<WorkoutItem>(WorkoutItemAdapter());
    Hive.registerAdapter<Workout>(WorkoutAdapter());
    Hive.registerAdapter<WorkoutLog>(WorkoutLogAdapter());

    /// Open Hive Boxes
    await Hive.openBox<Exercise>(EXERCISE_BOX_NAME);
    await Hive.openBox<WorkoutSettings>(WORKOUT_SETTINGS_BOX_NAME);
    await Hive.openBox(USER_SETTINGS_BOX_NAME);
    await Hive.openBox<Workout>(WORKOUTS_BOX_NAME);
    await Hive.openBox<WorkoutLog>(WORKOUT_LOGS_BOX_NAME);
  }
}
