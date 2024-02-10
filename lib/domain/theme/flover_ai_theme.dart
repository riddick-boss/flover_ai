import 'package:flutter/material.dart';

import 'flover_ai_material.dart';
import 'typography.dart';

class FloverAiTheme {
  static final FloverAiMaterial _floverAiMaterial =
      FloverAiMaterial(FloverAiTypography.textTheme);
  static ThemeData lightTheme = _floverAiMaterial.light();
  static ThemeData darkTheme = _floverAiMaterial.dark();
  static ThemeData highContrastTheme = _floverAiMaterial.lightHighContrast();
  static ThemeData highContrastDarkTheme = _floverAiMaterial.darkHighContrast();
}
