import 'package:abs_up/constants.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:flutter/material.dart';

import '../../presentation/theme/icons.t.dart';

import 'workout_settings.dart';

class Equipment {
  final String text;
  final IconData icon;
  final String key;

  Equipment({
    @required this.text,
    @required this.icon,
    @required this.key,
  });

  /// All equipment data
  static Map<String, Equipment> allEquipment = Map.fromIterable(
      EQUIPMENT_DATA_KEYS,
      key: (key) => key.toString(),
      value: (key) => Equipment(
          text: EQUIPMENT_TEXT[key],
          key: key.toString(),
          icon: AbsAppIcons.equipmentIcons[key]));

  static Equipment equipmentFromKey(String key) => allEquipment[key];

  bool get status {
    final WorkoutSettings settings = PDataService.workoutSettingsBox
        .get(WORKOUT_SETTINGS_KEY, defaultValue: WorkoutSettings());
    return settings.equipment.contains(key);
  }
}
