import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// AppTheme expone temas claros y oscuros listos para usar.
class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayLarge: AppTypography.headlineLarge,
      displayMedium: AppTypography.headlineMedium,
      titleLarge: AppTypography.title,
      bodyLarge: AppTypography.body,
      bodySmall: AppTypography.caption,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displayLarge: AppTypography.headlineLarge.copyWith(color: Colors.white),
      displayMedium: AppTypography.headlineMedium.copyWith(color: Colors.white),
      titleLarge: AppTypography.title.copyWith(color: Colors.white),
      bodyLarge: AppTypography.body.copyWith(color: Colors.white),
      bodySmall: AppTypography.caption.copyWith(color: Colors.white70),
    ),
  );
}

/// Aliases solicitados por el Design System
final ThemeData LightTheme = AppTheme.light;
final ThemeData DarkTheme = AppTheme.dark;