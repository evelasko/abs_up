import 'package:flutter/material.dart';

import '../../theme/icons.dart';

Widget equipmentRow(
        {List<String> activeEquipment = const [],
        double width = 288,
        double height = 32,
        Color baseColor = Colors.white30,
        Color activeColor = Colors.white}) =>
    Container(
      width: width,
      height: height,
      child: equipmentRowContent(
          activeEquipment: activeEquipment,
          iconSize: height,
          baseColor: baseColor,
          activeColor: activeColor),
    );

Widget equipmentRowContent(
        {List<String> activeEquipment = const [],
        double iconSize = 32,
        Color baseColor = Colors.white30,
        Color activeColor = Colors.white}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: AbsAppIcons.equipmentIcons
          .map<String, Icon>((key, value) => MapEntry(
              key,
              Icon(value,
                  size: iconSize,
                  color:
                      activeEquipment.contains(key) ? activeColor : baseColor)))
          .values
          .toList(),
    );
