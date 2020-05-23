import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:flutter/material.dart';
import './colors.t.dart';

final ThemeData appTheme = ThemeData(
  /// Text Theme
  fontFamily: 'Montserrat',
  textTheme: textTheme(),

  /// Color Theme
  canvasColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: colorScheme(),
  primaryColor: AppColors.greyDarkest,
  accentColor: AppColors.coquelicot,

  /// Widgets Theme
  appBarTheme: AppBarTheme(textTheme: textTheme()),
);
