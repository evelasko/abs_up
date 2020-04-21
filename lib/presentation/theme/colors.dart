import 'package:flutter/material.dart';

class AppColors {
  /// Application Colors
  static const Color rudy = Color(0xfffe042d);
  static const Color coquelicot = Color(0xfffd3510);
  static const Color orange = Color(0xfffe5800);
  static const Color candy = Color(0xfffe0c00);
  static const Color brandeis = Color(0xff006efd);
  static const Color deepSky = Color(0xff00c3fd);

  /// Greys
  static const Color greyDarkest = Color(0xff202125);
  static const Color greyDark = Color(0xff3c3d40);
  static const Color grey = Color(0xff9c9da1);
  static const Color greyLight = Color(0xffe2e2e6);
  static const Color greyLightest = Color(0xfff5f5f7);

  /// Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [rudy, orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
      colors: [brandeis, deepSky],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
  static const LinearGradient transparentGradient = LinearGradient(
      colors: [Color.fromARGB(0, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
  static const LinearGradient greyLightestFlatGradient = LinearGradient(
      colors: [greyLightest, greyLightest],
      begin: Alignment(-1.0, -2.0), // Alignment.topLeft,
      end: Alignment(1.0, 2.0) // Alignment.bottomRight,
      );
}

ColorScheme colorScheme() => const ColorScheme.dark(
      primary: AppColors.greyDarkest,
      primaryVariant: Colors.black,
      onPrimary: AppColors.grey,
      secondary: AppColors.greyLightest,
      secondaryVariant: AppColors.greyLight,
      onSecondary: AppColors.grey,
      surface: Colors.white,
      onSurface: AppColors.greyDarkest,
      onError: AppColors.coquelicot,
    );

int fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return int.parse(buffer.toString(), radix: 16);
}
