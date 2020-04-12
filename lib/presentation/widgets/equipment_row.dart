import 'package:flutter/material.dart';

import '../theme/icons.dart';

Widget equipmentRow({List<String> activeEquipment = const []}) => Container(
      width: 288,
      height: 32,
      child: Row(
        children: AbsAppIcons.equipmentIcons
            .map<String, Icon>((key, value) {
              print(key);
              return MapEntry(
                  key,
                  Icon(value,
                      size: 32,
                      color: activeEquipment.contains(key)
                          ? Colors.white
                          : Colors.white30));
            })
            .values
            .toList(),
      ),
    );
