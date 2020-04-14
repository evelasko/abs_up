import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';
import './colors.dart';

ThemeData appTheme() => ThemeData(

    /// Text Theme
    fontFamily: 'Montserrat',
    textTheme: textTheme(),

    /// Color Theme
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: colorScheme(),
    primaryColor: AppColors.greyDarkest,
    accentColor: AppColors.rudy,

    /// Widgets Theme
    appBarTheme: AppBarTheme(textTheme: textTheme()));
