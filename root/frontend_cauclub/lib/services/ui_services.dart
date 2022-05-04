import "package:flutter/material.dart";

class MaterialYouLight {
  static const Color onBackground = Color(0xffeae1d9);
  static const Color background = Color(0xff1f1b16);
  static const Color surfaceVarient = Color(0xff4e4538);
  static const Color primary = Color(0xffffba3b);
  static const Color onPrimary = Color(0xff442c00);
}

class MaterialYouDark {}

class MaterialColorScheme {
  static const seed = Color(0xFFFFB10A);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF815600),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDDAA),
    onPrimaryContainer: Color(0xFF281800),
    secondary: Color(0xFF6E5B3F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF9DEBB),
    onSecondaryContainer: Color(0xFF261904),
    tertiary: Color(0xFF4F6441),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD2EABE),
    onTertiaryContainer: Color(0xFF0E2005),
    error: Color(0xFFBA1B1B),
    errorContainer: Color(0xFFFFDAD4),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410001),
    background: Color(0xFFFCFCFC),
    onBackground: Color(0xFF1F1B16),
    surface: Color(0xFFFCFCFC),
    onSurface: Color(0xFF1F1B16),
    surfaceVariant: Color(0xFFEFE0CF),
    onSurfaceVariant: Color(0xFF4E4538),
    outline: Color(0xFF807567),
    onInverseSurface: Color(0xFFF8EFE7),
    inverseSurface: Color(0xFF34302A),
    inversePrimary: Color(0xFFFFBA3B),
    shadow: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFBA3B),
    onPrimary: Color(0xFF442C00),
    primaryContainer: Color(0xFF614000),
    onPrimaryContainer: Color(0xFFFFDDAA),
    secondary: Color(0xFFDCC3A1),
    onSecondary: Color(0xFF3D2E16),
    secondaryContainer: Color(0xFF55442A),
    onSecondaryContainer: Color(0xFFF9DEBB),
    tertiary: Color(0xFFB6CEA3),
    onTertiary: Color(0xFF223517),
    tertiaryContainer: Color(0xFF384C2B),
    onTertiaryContainer: Color(0xFFD2EABE),
    error: Color(0xFFFFB4A9),
    errorContainer: Color(0xFF930006),
    onError: Color(0xFF680003),
    onErrorContainer: Color(0xFFFFDAD4),
    background: Color(0xFF1F1B16),
    onBackground: Color(0xFFEAE1D9),
    surface: Color(0xFF1F1B16),
    onSurface: Color(0xFFEAE1D9),
    surfaceVariant: Color(0xFF4E4538),
    onSurfaceVariant: Color(0xFFD2C4B4),
    outline: Color(0xFF9B8F80),
    onInverseSurface: Color(0xFF1F1B16),
    inverseSurface: Color(0xFFEAE1D9),
    inversePrimary: Color(0xFF815600),
    shadow: Color(0xFF000000),
  );
}

ThemeData MaterialLightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      colorScheme: MaterialColorScheme.lightColorScheme,
      fontFamily: "CookieRun");
}

ThemeData MaterialDarkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      colorScheme: MaterialColorScheme.darkColorScheme,
      fontFamily: "CookieRun");
}
