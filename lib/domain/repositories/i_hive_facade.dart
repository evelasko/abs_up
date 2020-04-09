import 'package:data_setup/domain/models/exercise.dart';
import 'package:hive/hive.dart';

class IHiveFacade {
  /// Box names
  final List<String> hiveBoxNames = ['exercises', 'user_settings'];
  static final Box<Exercise> exercisesBox = Hive.box<Exercise>('exercises');
  static final Box userSettingsBox = Hive.box('user_settings');

  /// General methods
  static void initHiveAndAdapters(
      String directoryPath, List<TypeAdapter> adapters) {
    Hive.init(directoryPath);
    adapters.forEach((adapter) => Hive.registerAdapter(adapter));
  }

  static Future<bool> openHiveBoxes() async {
    await Hive.openBox<Exercise>('exercises');
    await Hive.openBox('user_settings');
    return true;
  }
}
