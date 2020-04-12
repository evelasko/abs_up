import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';
import './colors.dart';

ThemeData appTheme() => ThemeData(

    /// Text Theme
    fontFamily: 'Montserrat',
    textTheme: textTheme(),

    /// Color Theme
    canvasColor: Colors.transparent,
    colorScheme: colorScheme(),
    primaryColor: AppColors.greyDarkest,
    accentColor: AppColors.rudy,
    // primaryVariant: Colors.black,
    // onPrimary: AppColors().grey,
    // secondary: AppColors().greyLightest,
    // secondaryVariant: AppColors().greyLight,
    // onSecondary: AppColors().grey,
    // surface: Colors.white,
    // onSurface: AppColors().greyDarkest,
    // onError: AppColors().rudy,

    /// Widgets Theme
    appBarTheme: AppBarTheme(textTheme: textTheme()));
