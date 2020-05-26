import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:flutter/material.dart';
import './colors.t.dart';

final ThemeData appTheme = ThemeData(
  /// Text Theme
  fontFamily: 'Montserrat',
  textTheme: textTheme(),

  /// Color Theme
  canvasColor: AppColors.greyDark, // Colors.transparent,
  scaffoldBackgroundColor: AppColors.greyDark,
  backgroundColor: AppColors.greyLightest,
  colorScheme: colorScheme(),
  primaryColor: AppColors.greyDarkest,
  accentColor: AppColors.coquelicot,

  /// Widgets Theme
  appBarTheme: AppBarTheme(
    color: AppColors.greyDarkest,
    textTheme: textTheme(),
  ),
  bottomAppBarColor: AppColors.greyDarkest,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.greyDarkest,
      selectedItemColor: AppColors.coquelicot,
      selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.greyLight,
    actionTextColor: AppColors.greyDark,
    contentTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      color: AppColors.greyDark,
      fontSize: 14,
    ),
  ),
);
