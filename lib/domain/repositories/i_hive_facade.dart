import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/models/workout_item.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:hive/hive.dart';

import 'data_values.dart';

class IHiveFacade {
  /// Boxes
  static final Box<Exercise> exercisesBox =
      Hive.box<Exercise>(DataValues.exerciseBoxName);
  static final Box userSettingsBox = Hive.box(DataValues.userSettingsBoxName);
  static final Box<WorkoutSettings> workoutSettingsBox =
      Hive.box<WorkoutSettings>(DataValues.workoutSettingsBoxName);
  static final Box<Workout> workoutsBox = Hive.box(DataValues.workoutsBoxName);
  static final Box<Workout> workoutLogsBox =
      Hive.box(DataValues.workoutLogsBoxName);

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

    /// Open Hive Boxes
    await Hive.openBox<Exercise>(DataValues.exerciseBoxName);
    await Hive.openBox<WorkoutSettings>(DataValues.workoutSettingsBoxName);
    await Hive.openBox(DataValues.userSettingsBoxName);
    await Hive.openBox<Workout>(DataValues.workoutsBoxName);
    await Hive.openBox<Workout>(DataValues.workoutLogsBoxName);
  }
}
