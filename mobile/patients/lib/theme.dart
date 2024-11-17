import "package:flutter/material.dart";

class AppTheme{
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a66),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9df1eb),
      onPrimaryContainer: Color(0xff00201e),
      secondary: Color(0xff4a6361),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcce8e5),
      onSecondaryContainer: Color(0xff051f1e),
      tertiary: Color(0xff49607b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd0e4ff),
      onTertiaryContainer: Color(0xff011d34),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4948),
      outline: Color(0xff6f7978),
      outlineVariant: Color(0xffbec9c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff80d5cf),
      primaryFixed: Color(0xff9df1eb),
      onPrimaryFixed: Color(0xff00201e),
      primaryFixedDim: Color(0xff80d5cf),
      onPrimaryFixedVariant: Color(0xff00504c),
      secondaryFixed: Color(0xffcce8e5),
      onSecondaryFixed: Color(0xff051f1e),
      secondaryFixedDim: Color(0xffb0ccc9),
      onSecondaryFixedVariant: Color(0xff324b49),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff011d34),
      tertiaryFixedDim: Color(0xffb0c9e7),
      onTertiaryFixedVariant: Color(0xff314962),
      surfaceDim: Color(0xffd5dbda),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe9efee),
      surfaceContainerHigh: Color(0xffe3e9e8),
      surfaceContainerHighest: Color(0xffdde4e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004b48),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff25817c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e4745),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff607a77),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2d455e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5f7792),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3b4544),
      outline: Color(0xff576160),
      outlineVariant: Color(0xff737d7b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff80d5cf),
      primaryFixed: Color(0xff25817c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006763),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff607a77),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff47615f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5f7792),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff465e78),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbda),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe9efee),
      surfaceContainerHigh: Color(0xffe3e9e8),
      surfaceContainerHighest: Color(0xffdde4e2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002725),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004b48),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0c2625),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2e4745),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff08243b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2d455e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1c2625),
      outline: Color(0xff3b4544),
      outlineVariant: Color(0xff3b4544),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xffa6fbf5),
      primaryFixed: Color(0xff004b48),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003331),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2e4745),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff18312f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2d455e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff152e46),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbda),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe9efee),
      surfaceContainerHigh: Color(0xffe3e9e8),
      surfaceContainerHighest: Color(0xffdde4e2),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff80d5cf),
      surfaceTint: Color(0xff80d5cf),
      onPrimary: Color(0xff003735),
      primaryContainer: Color(0xff00504c),
      onPrimaryContainer: Color(0xff9df1eb),
      secondary: Color(0xffb0ccc9),
      onSecondary: Color(0xff1b3533),
      secondaryContainer: Color(0xff324b49),
      onSecondaryContainer: Color(0xffcce8e5),
      tertiary: Color(0xffb0c9e7),
      onTertiary: Color(0xff19324a),
      tertiaryContainer: Color(0xff314962),
      onTertiaryContainer: Color(0xffd0e4ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffdde4e2),
      onSurfaceVariant: Color(0xffbec9c7),
      outline: Color(0xff889391),
      outlineVariant: Color(0xff3f4948),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff006a66),
      primaryFixed: Color(0xff9df1eb),
      onPrimaryFixed: Color(0xff00201e),
      primaryFixedDim: Color(0xff80d5cf),
      onPrimaryFixedVariant: Color(0xff00504c),
      secondaryFixed: Color(0xffcce8e5),
      onSecondaryFixed: Color(0xff051f1e),
      secondaryFixedDim: Color(0xffb0ccc9),
      onSecondaryFixedVariant: Color(0xff324b49),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff011d34),
      tertiaryFixedDim: Color(0xffb0c9e7),
      onTertiaryFixedVariant: Color(0xff314962),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff2f3635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff85d9d3),
      surfaceTint: Color(0xff80d5cf),
      onPrimary: Color(0xff001a19),
      primaryContainer: Color(0xff489e99),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb5d0cd),
      onSecondary: Color(0xff011a19),
      secondaryContainer: Color(0xff7b9693),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb4cdec),
      onTertiary: Color(0xff00172c),
      tertiaryContainer: Color(0xff7b93b0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1514),
      onSurface: Color(0xfff6fcfa),
      onSurfaceVariant: Color(0xffc2cdcb),
      outline: Color(0xff9ba5a3),
      outlineVariant: Color(0xff7b8584),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00514e),
      primaryFixed: Color(0xff9df1eb),
      onPrimaryFixed: Color(0xff001413),
      primaryFixedDim: Color(0xff80d5cf),
      onPrimaryFixedVariant: Color(0xff003d3b),
      secondaryFixed: Color(0xffcce8e5),
      onSecondaryFixed: Color(0xff001413),
      secondaryFixedDim: Color(0xffb0ccc9),
      onSecondaryFixedVariant: Color(0xff213a39),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff001224),
      tertiaryFixedDim: Color(0xffb0c9e7),
      onTertiaryFixedVariant: Color(0xff1f3850),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff2f3635),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeafffc),
      surfaceTint: Color(0xff80d5cf),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff85d9d3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeafffc),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb5d0cd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffafaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb4cdec),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdfb),
      outline: Color(0xffc2cdcb),
      outlineVariant: Color(0xffc2cdcb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00302e),
      primaryFixed: Color(0xffa1f6f0),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff85d9d3),
      onPrimaryFixedVariant: Color(0xff001a19),
      secondaryFixed: Color(0xffd0ede9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb5d0cd),
      onSecondaryFixedVariant: Color(0xff011a19),
      tertiaryFixed: Color(0xffd8e8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb4cdec),
      onTertiaryFixedVariant: Color(0xff00172c),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff2f3635),
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
