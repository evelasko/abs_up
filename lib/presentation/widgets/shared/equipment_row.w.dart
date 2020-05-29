import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

import '../../theme/icons.t.dart';

class EquipmentRow extends StatelessWidget {
  final List<String> activeEquipment;
  final double iconSize;
  final Color baseColor;
  final Color activeColor;

  const EquipmentRow(
      {Key key,
      @required this.activeEquipment,
      this.iconSize = 30,
      this.baseColor = AppColors.greyDark,
      this.activeColor = AppColors.greyLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: AbsAppIcons.equipmentIcons
            .map<String, Icon>((key, value) => MapEntry(
                key,
                Icon(value,
                    size: iconSize,
                    color: activeEquipment.contains(key)
                        ? activeColor
                        : baseColor)))
            .values
            .toList(),
      );
}
