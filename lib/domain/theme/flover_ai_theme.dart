import 'package:flutter/material.dart';

import 'theme.g.dart';

class FloverAiTheme {
  static ThemeData lightTheme = const FloverAiMaterial(TextTheme()).light();
  static ThemeData darkTheme = const FloverAiMaterial(TextTheme()).dark();
  static ThemeData highContrastTheme =
      const FloverAiMaterial(TextTheme()).lightHighContrast();
  static ThemeData highContrastDarkTheme =
      const FloverAiMaterial(TextTheme()).darkHighContrast();
}
