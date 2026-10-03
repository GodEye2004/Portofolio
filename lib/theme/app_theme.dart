import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF0B0F19);
  static const Color surface = Color(0xFF141A2A);
  static const Color surfaceAlt = Color(0xFF1B2338);
  static const Color accent = Color(0xFF6C8CFF);
  static const Color accentAlt = Color(0xFF7CF5D0);
  static const Color textPrimary = Color(0xFFF3F5FA);
  static const Color textSecondary = Color(0xFFA7AFC2);
  static const Color border = Color(0xFF262E44);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6C8CFF), Color(0xFF7CF5D0)],
  );
}

class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accent,
        secondary: AppColors.accentAlt,
        surface: AppColors.surface,
      ),
      dividerColor: AppColors.border,
    );
  }
}
