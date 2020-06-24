import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/equipment.dart';

import 'package:abs_up/presentation/theme/icons.t.dart';
import 'package:hive/hive.dart';

part 'workout_settings.g.dart';

@HiveType(typeId: 2, adapterName: 'WorkoutSettingsAdapter')
class WorkoutSettings extends HiveObject {
  @HiveField(0)
  final int length;
  @HiveField(1)
  final int intensity;
  @HiveField(2)
  final int difficulty;
  @HiveField(3)
  final bool impact;
  @HiveField(4)
  final List<String> equipment;

  /// Returns a WorkoutSettings instance with *defaults settings* if no parameters are provided
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

  bool checkEquipmentStatusFor(String equipmentKey) =>
      equipment.contains(equipmentKey);

  WorkoutSettings copyWith(
          {int length,
          int intensity,
          int difficulty,
          bool impact,
          List<String> equipment}) =>
      WorkoutSettings(
          length: length ?? this.length,
          intensity: intensity ?? this.intensity,
          difficulty: difficulty ?? this.difficulty,
          impact: impact ?? this.impact,
          equipment: equipment ?? this.equipment);

  /// Comparison checker
  bool hasWorkoutSettingsKeys(Map<String, dynamic> maybeWorkoutSettings) =>
      maybeWorkoutSettings.containsKey(INTENSITY_KEY) &&
      maybeWorkoutSettings.containsKey(DIFFICULTY_KEY) &&
      maybeWorkoutSettings.containsKey(LENGTH_KEY) &&
      maybeWorkoutSettings.containsKey(IMPACT_KEY) &&
      maybeWorkoutSettings.containsKey(EQUIPMENT_KEY);
}
