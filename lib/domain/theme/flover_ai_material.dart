import 'package:flutter/material.dart';

class FloverAiMaterial {
  const FloverAiMaterial(this.textTheme);
  final TextTheme textTheme;

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b6939),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbcf0b4),
      onPrimaryContainer: Color(0xff002204),
      secondary: Color(0xff6f5d0e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffae287),
      onSecondaryContainer: Color(0xff221b00),
      tertiary: Color(0xff6e528a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffefdbff),
      onTertiaryContainer: Color(0xff280d42),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff7fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff191d17),
      surfaceVariant: Color(0xffdee5d8),
      onSurfaceVariant: Color(0xff424940),
      outline: Color(0xff72796f),
      outlineVariant: Color(0xffc2c9bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inverseOnSurface: Color(0xffeff2e9),
      inversePrimary: Color(0xffa1d39a),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff002204),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff245024),
      secondaryFixed: Color(0xfffae287),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffddc66e),
      onSecondaryFixedVariant: Color(0xff544600),
      tertiaryFixed: Color(0xffefdbff),
      onTertiaryFixed: Color(0xff280d42),
      tertiaryFixedDim: Color(0xffdab9f9),
      onTertiaryFixedVariant: Color(0xff553b71),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5eb),
      surfaceContainer: Color(0xffecefe6),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff204c20),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff517f4e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff504200),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff867325),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff51376d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8568a2),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff191d17),
      surfaceVariant: Color(0xffdee5d8),
      onSurfaceVariant: Color(0xff3e453c),
      outline: Color(0xff5a6157),
      outlineVariant: Color(0xff767d72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inverseOnSurface: Color(0xffeff2e9),
      inversePrimary: Color(0xffa1d39a),
      primaryFixed: Color(0xff517f4e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff396637),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff867325),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c5b0b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8568a2),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6b5088),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5eb),
      surfaceContainer: Color(0xffecefe6),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff002905),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff204c20),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a2200),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff504200),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f1549),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff51376d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdee5d8),
      onSurfaceVariant: Color(0xff1f261e),
      outline: Color(0xff3e453c),
      outlineVariant: Color(0xff3e453c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffc6fabd),
      primaryFixed: Color(0xff204c20),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff05350b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff504200),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff362c00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff51376d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a2055),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5eb),
      surfaceContainer: Color(0xffecefe6),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa1d39a),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff0a390f),
      primaryContainer: Color(0xff245024),
      onPrimaryContainer: Color(0xffbcf0b4),
      secondary: Color(0xffddc66e),
      onSecondary: Color(0xff3a3000),
      secondaryContainer: Color(0xff544600),
      onSecondaryContainer: Color(0xfffae287),
      tertiary: Color(0xffdab9f9),
      onTertiary: Color(0xff3e2459),
      tertiaryContainer: Color(0xff553b71),
      onTertiaryContainer: Color(0xffefdbff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff10140f),
      onBackground: Color(0xffe0e4db),
      surface: Color(0xff10140f),
      onSurface: Color(0xffe0e4db),
      surfaceVariant: Color(0xff424940),
      onSurfaceVariant: Color(0xffc2c9bd),
      outline: Color(0xff8c9388),
      outlineVariant: Color(0xff424940),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inverseOnSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff3b6939),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff002204),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff245024),
      secondaryFixed: Color(0xfffae287),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffddc66e),
      onSecondaryFixedVariant: Color(0xff544600),
      tertiaryFixed: Color(0xffefdbff),
      onTertiaryFixed: Color(0xff280d42),
      tertiaryFixedDim: Color(0xffdab9f9),
      onTertiaryFixedVariant: Color(0xff553b71),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff323630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa5d89e),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff001c03),
      primaryContainer: Color(0xff6d9c68),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe1ca72),
      onSecondary: Color(0xff1c1600),
      secondaryContainer: Color(0xffa4903e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdfbefe),
      onTertiary: Color(0xff22063d),
      tertiaryContainer: Color(0xffa284c0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff10140f),
      onBackground: Color(0xffe0e4db),
      surface: Color(0xff10140f),
      onSurface: Color(0xfff9fcf3),
      surfaceVariant: Color(0xff424940),
      onSurfaceVariant: Color(0xffc6cdc1),
      outline: Color(0xff9ea59a),
      outlineVariant: Color(0xff7e857b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inverseOnSurface: Color(0xff272b25),
      inversePrimary: Color(0xff255125),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff001602),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff123f14),
      secondaryFixed: Color(0xfffae287),
      onSecondaryFixed: Color(0xff161100),
      secondaryFixedDim: Color(0xffddc66e),
      onSecondaryFixedVariant: Color(0xff413500),
      tertiaryFixed: Color(0xffefdbff),
      onTertiaryFixed: Color(0xff1d0138),
      tertiaryFixedDim: Color(0xffdab9f9),
      onTertiaryFixedVariant: Color(0xff442a5f),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff323630),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff1ffea),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa5d89e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe1ca72),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdfbefe),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff10140f),
      onBackground: Color(0xffe0e4db),
      surface: Color(0xff10140f),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff424940),
      onSurfaceVariant: Color(0xfff7fdf0),
      outline: Color(0xffc6cdc1),
      outlineVariant: Color(0xffc6cdc1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff033209),
      primaryFixed: Color(0xffc0f4b8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa5d89e),
      onPrimaryFixedVariant: Color(0xff001c03),
      secondaryFixed: Color(0xffffe68b),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe1ca72),
      onSecondaryFixedVariant: Color(0xff1c1600),
      tertiaryFixed: Color(0xfff2e0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffdfbefe),
      onTertiaryFixedVariant: Color(0xff22063d),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff323630),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
