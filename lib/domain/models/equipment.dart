import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../presentation/theme/icons.t.dart';

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
  static Map<String, Equipment> get allEquipment =>
      Map.fromIterable(EQUIPMENT_DATA_KEYS,
          key: (key) => key.toString(),
          value: (key) => Equipment(
              text: EQUIPMENT_TEXT[key],
              key: key.toString(),
              icon: AbsAppIcons.equipmentIcons[key]));

  static Equipment equipmentFromKey(String key) =>
      allEquipment.containsKey(key ?? '') ? allEquipment[key] : null;
}
