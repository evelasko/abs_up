import 'package:abs_up/domain/state/workouts_store.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/equipment.dart';

class EquipmentChip extends StatelessWidget {
  final Equipment equipment;
  final void Function(bool) onSelected;

  const EquipmentChip(this.equipment, {Key key, @required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool status = Provider.of<WorkoutsStore>(context, listen: false)
        .checkEquipmentStatus(equipment.key);
    return FilterChip(
      label: Text(equipment.text,
          style: status
              ? AppTextStyles.chipText
              : AppTextStyles.chipText.copyWith(color: AppColors.grey)),
      avatar: Container(
        width: 22,
        height: 22,
        margin: const EdgeInsets.only(left: 5),
        child: Icon(
          equipment.icon,
          size: 22,
          color: status ? AppColors.greyDarkest : AppColors.grey,
        ),
      ),
      onSelected: onSelected,
      elevation: 5,
      selectedShadowColor: Colors.black38,
      shadowColor: Colors.transparent,
      selected: status,
      showCheckmark: false,
      selectedColor: AppColors.greyLight,
      backgroundColor: AppColors.greyDarkest, // const Color(0x1e767680),
    );
  }
}
