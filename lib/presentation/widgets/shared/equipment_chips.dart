import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/equipment.dart';

FilterChip equipmentChip(
    {@required Equipment equipment, @required void Function(bool) onSelected}) {
  bool status = equipment.status;
  return FilterChip(
    label: Text(equipment.text,
        style: status
            ? AppTextStyles.chipText
            : AppTextStyles.chipText.copyWith(color: AppColors.greyDarkest)),
    avatar: Container(
      width: 22,
      height: 22,
      margin: EdgeInsets.only(left: 5),
      child: Icon(
        equipment.icon,
        size: 22,
        color: status ? AppColors.greyDarkest : AppColors.greyDarkest,
      ),
    ),
    onSelected: onSelected,
    elevation: 5,
    selectedShadowColor: Colors.black38,
    shadowColor: Colors.transparent,
    selected: status,
    showCheckmark: false,
    selectedColor: Colors.white,
    backgroundColor: Color(0x1e767680),
  );
}
