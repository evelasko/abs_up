import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

class FilterLabel extends StatelessWidget {
  final String text;
  const FilterLabel(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 5),
        child: Text(
          text.toUpperCase() ?? '',
          style: const TextStyle(
            letterSpacing: 1,
            color: AppColors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
}
