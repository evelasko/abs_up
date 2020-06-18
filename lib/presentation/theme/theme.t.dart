import 'package:flutter/material.dart';

import './colors.t.dart';
import 'text.t.dart';

final ThemeData appTheme = ThemeData(
  /// Text Theme
  fontFamily: 'Montserrat',
  textTheme: textTheme(),

  /// Color Theme
  canvasColor: AppColors.black, // Colors.transparent,
  scaffoldBackgroundColor: AppColors.black,
  backgroundColor: AppColors.black,
  colorScheme: colorScheme(),
  primaryColor: AppColors.greyDarkest,
  accentColor: AppColors.coquelicot,

  /// Widgets Theme
  appBarTheme: AppBarTheme(
    color: AppColors.greyDarkest,
    textTheme: textTheme(),
  ),
  bottomAppBarColor: AppColors.greyDarkest,
  // ignore: undefined_named_parameter, undefined_class
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
