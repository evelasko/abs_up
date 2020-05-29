import 'package:flutter/material.dart';

import '../../theme/colors.t.dart';

class FilterChipWidget extends StatelessWidget {
  final double spacing;
  final String label;
  final bool selected;
  final void Function(bool) onSelected;
  final IconData icon;
  const FilterChipWidget({
    Key key,
    @required this.label,
    @required this.selected,
    @required this.onSelected,
    this.icon,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spacing == null
          ? const EdgeInsets.symmetric(horizontal: 5)
          : EdgeInsets.symmetric(horizontal: spacing),
      child: FilterChip(
          elevation: 0,
          pressElevation: 0,
          showCheckmark: false,
          backgroundColor: Colors.black,
          selectedColor: AppColors.coquelicot,
          labelStyle: const TextStyle(
            color: AppColors.greyLight,
            fontSize: 14,
          ),
          selected: selected ?? false,
          padding: icon != null
              ? const EdgeInsets.only(left: 5)
              : const EdgeInsets.all(0),
          labelPadding: icon != null
              ? const EdgeInsets.only(left: 1, right: 10)
              : const EdgeInsets.symmetric(horizontal: 12),
          avatar: icon != null
              ? Icon(
                  icon,
                  color: AppColors.greyLight,
                )
              : null,
          label: Text(label ?? ''),
          onSelected: onSelected ?? (_) {}),
    );
  }
}
