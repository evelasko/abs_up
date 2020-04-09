import 'package:data_setup/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

Widget listItemWrapper(Widget child) => Container(
      constraints: BoxConstraints.expand(height: 100),
      padding: EdgeInsets.all(10),
      child: child,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.greyLight, width: 1))),
    );
