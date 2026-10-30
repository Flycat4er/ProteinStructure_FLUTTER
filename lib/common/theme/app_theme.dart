import 'package:flutter/material.dart';
import 'package:protein_structure/common/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: brightness,
    ),
    fontFamily: 'Roboto',
    cardTheme: const CardThemeData(
      elevation: 1,
      margin: EdgeInsets.zero,
    ),
  );
}
