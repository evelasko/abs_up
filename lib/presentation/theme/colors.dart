import 'package:flutter/material.dart';

class AppColors {
  /// Application Colors
  static const Color rudy = const Color(4294837293);
  static const Color coquelicot = const Color(4294784272);
  static const Color orange = const Color(4294858752);
  static const Color candy = const Color(4294839296);
  static const Color brandeis = const Color(4278218493);
  static const Color deepSky = const Color(4278240253);

  /// Greys
  static const Color greyDarkest = const Color(4280295717);
  static const Color greyDark = const Color(4282137920);
  static const Color grey = const Color(4288454049);
  static const Color greyLight = const Color(4293059302);
  static const Color greyLightest = const Color(4294309367);

  /// Gradients
  static const LinearGradient primaryGradient = const LinearGradient(
    colors: [rudy, orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient secondaryGradient = const LinearGradient(
      colors: [brandeis, deepSky],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
  static const LinearGradient transparentGradient = const LinearGradient(
      colors: [Color.fromARGB(0, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
  static const LinearGradient greyLightestFlatGradient = const LinearGradient(
      colors: [greyLightest, greyLightest],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
}

ColorScheme colorScheme() => ColorScheme.dark(
      primary: AppColors.greyDarkest,
      primaryVariant: Colors.black,
      onPrimary: AppColors.grey,
      secondary: AppColors.greyLightest,
      secondaryVariant: AppColors.greyLight,
      onSecondary: AppColors.grey,
      surface: Colors.white,
      onSurface: AppColors.greyDarkest,
      onError: AppColors.rudy,
    );

int fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return (int.parse(buffer.toString(), radix: 16));
}
