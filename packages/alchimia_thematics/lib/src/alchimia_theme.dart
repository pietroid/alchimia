import 'package:alchimia_thematics/src/alchimia_colors.dart';
import 'package:flutter/material.dart';

/// Provides the global [ThemeData] for Alchimia.
abstract final class AlchimiaTheme {
  static ThemeData get data => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Menlo',
        scaffoldBackgroundColor: AlchimiaColors.background,
        colorScheme: const ColorScheme.dark(
          surface: AlchimiaColors.background,
          onSurface: AlchimiaColors.cream,
          outline: AlchimiaColors.border,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AlchimiaColors.panel,
          foregroundColor: AlchimiaColors.cream,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AlchimiaColors.dimText,
            fontFamily: 'Menlo',
          ),
        ),
      );
}
