//: Data model: Workout Settings
import 'package:data_setup/domain/models/equipment.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/presentation/theme/icons.dart';
import 'package:hive/hive.dart';

part 'workout_settings.g.dart';

@HiveType(typeId: 2, adapterName: 'WorkoutSettingsAdapter')
class WorkoutSettings extends HiveObject {
  @HiveField(0)
  int length;
  @HiveField(1)
  int intensity;
  @HiveField(2)
  int difficulty;
  @HiveField(3)
  bool impact;
  @HiveField(4)
  List<String> equipment;

  WorkoutSettings(
      {this.length = DataValues.lengthDefault,
      this.intensity = DataValues.intensityDefault,
      this.difficulty = DataValues.difficultyDefault,
      this.impact = DataValues.impactDefault,
      this.equipment = const [DataValues.equipmentDefault]});

  /// Data UI getters
  String get intensityString => DataValues.intensityToString(intensity);
  String get difficultyString => DataValues.difficultyToString(difficulty);
  String get lengthString => DataValues.lengthToString(length);
  String get impactString => DataValues.impactToString(impact);

  Iterable<Equipment> get equipmentObjectList =>
      equipment.map((equipmentKey) => Equipment(
          key: equipmentKey,
          icon: AbsAppIcons.equipmentIcons[equipmentKey],
          text: DataValues.equipmentText[equipmentKey]));

  /// Data UI Set & Save
  Future<void> intensitySetAndSave(String newValue) async {
    intensity = DataValues.intensityToInt(
        newValue ?? DataValues.intensityDefault as String);
    await save();
  }

  Future<void> difficultySetAndSave(String newValue) async {
    difficulty = DataValues.difficultyToInt(
        newValue ?? DataValues.difficultyDefault as String);
    await save();
  }

  Future<void> lengthSetAndSave(String newValue) async {
    length =
        DataValues.lengthToInt(newValue ?? DataValues.lengthDefault as String);
    await save();
  }

  Future<void> impactSetOrToggleAndSave(bool newValue) async {
    impact = newValue ?? !impact;
    await save();
  }

  Future<void> addEquipment({String key, Equipment equipment}) async {
    final String _key = key ?? equipment.key;
    if (this.equipment.contains(_key)) return;
    this.equipment = [...this.equipment, _key];
    await save();
  }

  Future<void> removeEquipment({String key, Equipment equipment}) async {
    final String _key = key ?? equipment.key;
    if (!this.equipment.contains(_key)) return;
    this.equipment = [...this.equipment]..remove(_key);
    await save();
  }

  /// Default settings
  static const Map<String, dynamic> defaultSettingsMap = {
    DataValues.lengthKey: DataValues.lengthDefault,
    DataValues.intensityKey: DataValues.intensityDefault,
    DataValues.difficultyKey: DataValues.difficultyDefault,
    DataValues.impactKey: DataValues.impactDefault,
    DataValues.equipmentKey: [DataValues.equipmentDefault]
  };

  /// Comparison checker
  bool hasWorkoutSettingsKeys(Map<String, dynamic> maybeWorkoutSettings) =>
      maybeWorkoutSettings.containsKey(DataValues.intensityKey) &&
      maybeWorkoutSettings.containsKey(DataValues.difficultyKey) &&
      maybeWorkoutSettings.containsKey(DataValues.lengthKey) &&
      maybeWorkoutSettings.containsKey(DataValues.impactKey) &&
      maybeWorkoutSettings.containsKey(DataValues.equipmentKey);
}
