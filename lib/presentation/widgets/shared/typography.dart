import 'package:abs_up/presentation/theme/colors.dart';
import 'package:abs_up/presentation/theme/text.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static Widget sectionHeadingLight(String text) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 20,
      child: Center(
        child: Text(text.toUpperCase(),
            style: AppTextStyles.appSectionHeadingLightText),
      ));

  static Widget settingsDataRow(String header, String value) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.greyDark))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Text(
                  header.toUpperCase(),
                  textAlign: TextAlign.right,
                  style: AppTextStyles.currentWorkoutSettingsData,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  value.toUpperCase(),
                  style: AppTextStyles.currentWorkoutSettingsData
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
}
