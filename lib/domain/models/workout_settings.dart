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

  // /// Main user settings box
  // static Box<dynamic> box = IHiveFacade.userSettingsBox;

  /// Current user settings from box or defaults
  // int length = box.get(DataValues.lengthKey, defaultValue: DataValues.lengthDefault);
  // int intensity  = box.get(DataValues.intensityKey, defaultValue: DataValues.intensityDefault);
  // int difficulty  = box.get(DataValues.difficultyKey, defaultValue: DataValues.difficultyDefault);
  // bool impact  = box.get(DataValues.impactKey, defaultValue: DataValues.impactDefault);
  // List<String> equipment  = box.get(DataValues.equipmentKey, defaultValue: DataValues.equipmentDefault);

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

  List<Equipment> get equipmentObjectList =>
      equipment.map((equipmentKey) => Equipment(
          key: equipmentKey,
          icon: AbsAppIcons.equipmentIcons[equipmentKey],
          text: DataValues.equipmentText[equipmentKey]));

  /// Data UI Set & Save
  Future<void> intensitySetAndSave(String newValue) async {
    this.intensity =
        DataValues.intensityToInt(newValue ?? DataValues.intensityDefault);
    await this.save();
  }

  Future<void> difficultySetAndSave(String newValue) async {
    this.difficulty =
        DataValues.difficultyToInt(newValue ?? DataValues.difficultyDefault);
    await this.save();
  }

  Future<void> lengthSetAndSave(String newValue) async {
    this.length = DataValues.lengthToInt(newValue ?? DataValues.lengthDefault);
    await this.save();
  }

  Future<void> impactSetOrToggleAndSave(bool newValue) async {
    this.impact = newValue ?? !this.impact;
    await this.save();
  }

  Future<void> addEquipment({String key, Equipment equipment}) async {
    key = key ?? equipment.key;
    if (this.equipment.contains(key)) return;
    this.equipment = []
      ..addAll(this.equipment)
      ..add(key);
    await this.save();
  }

  Future<void> removeEquipment({String key, Equipment equipment}) async {
    key = key ?? equipment.key;
    if (!this.equipment.contains(key)) return;
    this.equipment = []
      ..addAll(this.equipment)
      ..remove(key);
    await this.save();
  }

  /// Default settings
  static const Map<String, dynamic> defaultSettingsMap = {
    DataValues.lengthKey: DataValues.lengthDefault,
    DataValues.intensityKey: DataValues.intensityDefault,
    DataValues.difficultyKey: DataValues.difficultyDefault,
    DataValues.impactKey: DataValues.impactDefault,
    DataValues.equipmentKey: [DataValues.equipmentDefault]
  };

  /// Returns a map with the provided values updated; it does not updates the instance
  /// nor returns new instance with updated values.
  /// This is only to feed the box key (workoutSettings) with updated values.
  // Map<String, dynamic> saveWith(
  //         {int length,
  //         int intensity,
  //         int difficulty,
  //         bool impact,
  //         List<String> equipment}) =>
  //     {
  //       DataValues.lengthKey: length ?? this.length,
  //       DataValues.intensityKey: intensity ?? this.intensity,
  //       DataValues.difficultyKey: difficulty ?? this.difficulty,
  //       DataValues.impactKey: impact ?? this.impact,
  //       DataValues.equipmentKey: equipment ?? this.equipment
  //     };

  /// Comparison checker
  bool hasWorkoutSettingsKeys(Map<String, dynamic> maybeWorkoutSettings) =>
      maybeWorkoutSettings.containsKey(DataValues.intensityKey) &&
      maybeWorkoutSettings.containsKey(DataValues.difficultyKey) &&
      maybeWorkoutSettings.containsKey(DataValues.lengthKey) &&
      maybeWorkoutSettings.containsKey(DataValues.impactKey) &&
      maybeWorkoutSettings.containsKey(DataValues.equipmentKey);
}
