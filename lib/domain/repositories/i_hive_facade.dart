import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:hive/hive.dart';

import 'data_values.dart';

class IHiveFacade {
  /// Box names
  static const List<String> hiveBoxNames = const [
    DataValues.exerciseBoxName,
    DataValues.userSettingsBoxName,
    DataValues.workoutSettingsBoxName
  ];

  /// Boxes
  static final Box<Exercise> exercisesBox =
      Hive.box<Exercise>(DataValues.exerciseBoxName);
  static final Box userSettingsBox = Hive.box(DataValues.userSettingsBoxName);
  static final Box<WorkoutSettings> workoutSettingsBox =
      Hive.box<WorkoutSettings>(DataValues.workoutSettingsBoxName);

  /// General methods
  static Future<void> initHive() async {
    final documentsDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    /// Init Hive
    Hive.init(documentsDirectory.path);
    Hive.registerAdapter<Exercise>(ExerciseAdapter());
    Hive.registerAdapter<WorkoutSettings>(WorkoutSettingsAdapter());

    /// Open Hive Boxes
    await Hive.openBox<Exercise>(DataValues.exerciseBoxName);
    await Hive.openBox<WorkoutSettings>(DataValues.workoutSettingsBoxName);
    await Hive.openBox(DataValues.userSettingsBoxName);
  }
}
