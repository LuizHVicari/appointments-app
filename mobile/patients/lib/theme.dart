import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3a608f),
      surfaceTint: Color(0xff3a608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd3e3ff),
      onPrimaryContainer: Color(0xff001c38),
      secondary: Color(0xff515b92),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdee0ff),
      onSecondaryContainer: Color(0xff0b154b),
      tertiary: Color(0xff0d6680),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbaeaff),
      onTertiaryContainer: Color(0xff001f29),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff41484d),
      outline: Color(0xff71787d),
      outlineVariant: Color(0xffc0c7cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3035),
      inversePrimary: Color(0xffa3c9fe),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9fe),
      onPrimaryFixedVariant: Color(0xff1f4876),
      secondaryFixed: Color(0xffdee0ff),
      onSecondaryFixed: Color(0xff0b154b),
      secondaryFixedDim: Color(0xffbac3ff),
      onSecondaryFixedVariant: Color(0xff394379),
      tertiaryFixed: Color(0xffbaeaff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff89d0ee),
      onTertiaryFixedVariant: Color(0xff004d62),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1a4471),
      surfaceTint: Color(0xff3a608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5176a7),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff353f74),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6871aa),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00495d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff317d98),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff3d4449),
      outline: Color(0xff596065),
      outlineVariant: Color(0xff747c81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3035),
      inversePrimary: Color(0xffa3c9fe),
      primaryFixed: Color(0xff5176a7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff375e8c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6871aa),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f5890),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff317d98),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff06647e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002344),
      surfaceTint: Color(0xff3a608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1a4471),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff131d52),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff353f74),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002632),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00495d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1e2529),
      outline: Color(0xff3d4449),
      outlineVariant: Color(0xff3d4449),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3035),
      inversePrimary: Color(0xffe3ecff),
      primaryFixed: Color(0xff1a4471),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002e56),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff353f74),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e285d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00495d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003140),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa3c9fe),
      surfaceTint: Color(0xffa3c9fe),
      onPrimary: Color(0xff00315c),
      primaryContainer: Color(0xff1f4876),
      onPrimaryContainer: Color(0xffd3e3ff),
      secondary: Color(0xffbac3ff),
      onSecondary: Color(0xff222c61),
      secondaryContainer: Color(0xff394379),
      onSecondaryContainer: Color(0xffdee0ff),
      tertiary: Color(0xff89d0ee),
      onTertiary: Color(0xff003545),
      tertiaryContainer: Color(0xff004d62),
      onTertiaryContainer: Color(0xffbaeaff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111318),
      onSurface: Color(0xffe1e2e8),
      onSurfaceVariant: Color(0xffc0c7cd),
      outline: Color(0xff8a9297),
      outlineVariant: Color(0xff41484d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff3a608f),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9fe),
      onPrimaryFixedVariant: Color(0xff1f4876),
      secondaryFixed: Color(0xffdee0ff),
      onSecondaryFixed: Color(0xff0b154b),
      secondaryFixedDim: Color(0xffbac3ff),
      onSecondaryFixedVariant: Color(0xff394379),
      tertiaryFixed: Color(0xffbaeaff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff89d0ee),
      onTertiaryFixedVariant: Color(0xff004d62),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaacdff),
      surfaceTint: Color(0xffa3c9fe),
      onPrimary: Color(0xff001730),
      primaryContainer: Color(0xff6e93c5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc0c7ff),
      onSecondary: Color(0xff040f46),
      secondaryContainer: Color(0xff848dc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff8ed4f2),
      onTertiary: Color(0xff001922),
      tertiaryContainer: Color(0xff529ab5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111318),
      onSurface: Color(0xfffbfaff),
      onSurfaceVariant: Color(0xffc5ccd2),
      outline: Color(0xff9da4aa),
      outlineVariant: Color(0xff7d848a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff204977),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001227),
      primaryFixedDim: Color(0xffa3c9fe),
      onPrimaryFixedVariant: Color(0xff053764),
      secondaryFixed: Color(0xffdee0ff),
      onSecondaryFixed: Color(0xff000841),
      secondaryFixedDim: Color(0xffbac3ff),
      onSecondaryFixedVariant: Color(0xff283267),
      tertiaryFixed: Color(0xffbaeaff),
      onTertiaryFixed: Color(0xff00141b),
      tertiaryFixedDim: Color(0xff89d0ee),
      onTertiaryFixedVariant: Color(0xff003b4c),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffa3c9fe),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffaacdff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc0c7ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff6fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff8ed4f2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff8fbff),
      outline: Color(0xffc5ccd2),
      outlineVariant: Color(0xffc5ccd2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff002b51),
      primaryFixed: Color(0xffdae8ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffaacdff),
      onPrimaryFixedVariant: Color(0xff001730),
      secondaryFixed: Color(0xffe4e5ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0c7ff),
      onSecondaryFixedVariant: Color(0xff040f46),
      tertiaryFixed: Color(0xffc6edff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff8ed4f2),
      onTertiaryFixedVariant: Color(0xff001922),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

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
