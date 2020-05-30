import 'package:flutter/material.dart';

import '../../theme/colors.t.dart';

class CounterChip extends StatelessWidget {
  final String count;
  const CounterChip(
    this.count, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FilterChip(
        backgroundColor: AppColors.greyDarkest,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.greyDark),
            borderRadius: BorderRadius.circular(20)),
        label: Text(count),
        labelStyle:
            const TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500),
        onSelected: (_) {},
      );
}
