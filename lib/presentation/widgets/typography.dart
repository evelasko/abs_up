import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static Widget sectionHeadingLight(String text) => Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.greyLight,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 20,
      child: Center(
        child: Text(text.toUpperCase(),
            style: AppTextStyles.appSectionHeadingLightText),
      ));
}
