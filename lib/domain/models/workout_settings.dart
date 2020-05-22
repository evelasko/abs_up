//: Data model: Workout Settings
import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/equipment.dart';

import 'package:abs_up/presentation/theme/icons.t.dart';
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
      {this.length = LENGTH_DEFAULT,
      this.intensity = INTENSITY_DEFAULT,
      this.difficulty = DIFFICULTY_DEFAULT,
      this.impact = IMPACT_DEFAULT,
      this.equipment = const [EQUIPMENT_DEFAULT]});

  /// Data UI getters
  String get intensityString => intensityToString(intensity);
  String get difficultyString => difficultyToString(difficulty);
  String get lengthString => lengthToString(length);
  String get impactString => impactToString(impact);

  Iterable<Equipment> get equipmentObjectList =>
      equipment.map((equipmentKey) => Equipment(
          key: equipmentKey,
          icon: AbsAppIcons.equipmentIcons[equipmentKey],
          text: EQUIPMENT_TEXT[equipmentKey]));

  /// Data UI Set & Save
  Future<void> intensitySetAndSave(String newValue) async {
    intensity = intensityToInt(newValue ?? INTENSITY_DEFAULT as String);
    await save();
  }

  Future<void> difficultySetAndSave(String newValue) async {
    difficulty = difficultyToInt(newValue ?? DIFFICULTY_DEFAULT as String);
    await save();
  }

  Future<void> lengthSetAndSave(String newValue) async {
    length = lengthToInt(newValue ?? LENGTH_DEFAULT as String);
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

  /// Comparison checker
  bool hasWorkoutSettingsKeys(Map<String, dynamic> maybeWorkoutSettings) =>
      maybeWorkoutSettings.containsKey(INTENSITY_KEY) &&
      maybeWorkoutSettings.containsKey(DIFFICULTY_KEY) &&
      maybeWorkoutSettings.containsKey(LENGTH_KEY) &&
      maybeWorkoutSettings.containsKey(IMPACT_KEY) &&
      maybeWorkoutSettings.containsKey(EQUIPMENT_KEY);
}
