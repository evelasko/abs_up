import 'package:data_setup/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

TextTheme textTheme() => TextTheme(
    // headline1: TextStyle(color: AppColors.rudy),
    headline2: TextStyle(color: Colors.pink),
    headline3: TextStyle(color: Colors.purple),
    headline4: TextStyle(color: Colors.green),
    headline5: TextStyle(color: Colors.indigo),

    /// AppBar Text
    headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Montserrat'));

/// Text Styles
class AppTextStyles {
  /// List Items
  static const TextStyle listItemUpperTitle = const TextStyle(
      fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.greyDark);
  static const TextStyle listItemTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.greyDarkest);
  static const TextStyle listItemTitleAccent = const TextStyle(
      fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.rudy);
  static const TextStyle listItemBottomInfo = const TextStyle(
      fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.grey);

  /// Page Widgets
  static const TextStyle appSectionHeadingLightText = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.greyDarkest);
  static const TextStyle homeButtonText = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.greyLight);
  static const TextStyle emptyListFeedbackBody = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.greyDarkest);

  /// Current Workout Settings
  static const TextStyle currentWorkoutSettingsData = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.grey);

  /// Chip text
  static const TextStyle chipText = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.greyDarkest);

  /// Tab Bar Items
  static const TextStyle tabBarItem =
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w600);

  /// Saved workout title
  static const TextStyle savedWorkoutTitle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.greyDarkest);
}
