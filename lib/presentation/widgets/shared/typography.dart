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

  static Widget settingsDataRow(String header, String value) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        padding: EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.greyDark, width: 1))),
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
              flex: 1,
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
