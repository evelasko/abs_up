import 'package:flutter/material.dart';

import '../../presentation/theme/icons.dart';
import '../repositories/data_values.dart';
import '../repositories/i_hive_facade.dart';
import 'workout_settings.dart';

class Equipment {
  final String text;
  final IconData icon;
  final String key;

  Equipment({@required this.text, @required this.icon, @required this.key});

  /// All equipment data
  static Map<String, Equipment> allEquipment = Map.fromIterable(
      DataValues.equipmentDataKeys,
      key: (key) => key.toString(),
      value: (key) => Equipment(
          text: DataValues.equipmentText[key],
          key: key.toString(),
          icon: AbsAppIcons.equipmentIcons[key]));

  static Equipment equipmentFromKey(String key) => allEquipment[key];

  bool get status {
    final WorkoutSettings settings = IHiveFacade.workoutSettingsBox
        .get(DataValues.workoutSettingsKey, defaultValue: WorkoutSettings());
    return settings.equipment.contains(key);
  }
}
