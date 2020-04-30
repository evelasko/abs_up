import 'package:abs_up/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

Widget listItemWrapper(Widget child) => Container(
      constraints: const BoxConstraints.expand(height: 100),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.greyLight, width: 1))),
      child: child,
    );

Widget listSmallItemWrapper(Widget child) => Container(
      constraints: const BoxConstraints.expand(height: 60),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.greyLight, width: 1))),
      child: child,
    );
