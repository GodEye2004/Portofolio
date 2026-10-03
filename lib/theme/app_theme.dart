import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Editorial "printed page" palette — warm paper, ink, one restrained
/// evergreen accent. No gradients, no glow.
class AppColors {
  static const Color paper = Color(0xFFFAF8F3);
  static const Color card = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF211D14);
  static const Color muted = Color(0xFF6E6859);
  static const Color faint = Color(0xFFA39C8B);
  static const Color line = Color(0xFFE4DECF);
  static const Color accent = Color(0xFF175C44);
  static const Color accentSoft = Color(0xFFE7F0EB);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    final serif = GoogleFonts.fraunces();
    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.paper,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        primary: AppColors.accent,
        surface: AppColors.paper,
        brightness: Brightness.light,
      ),
      dividerColor: AppColors.line,
      splashFactory: InkSparkle.splashFactory,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.accent,
      ),
      extensions: [AppSerif(serif)],
    );
  }
}

/// Carries the display serif family so widgets can opt into it without
/// rebuilding the text theme.
class AppSerif extends ThemeExtension<AppSerif> {
  final TextStyle base;
  const AppSerif(this.base);

  static TextStyle of(BuildContext context) =>
      Theme.of(context).extension<AppSerif>()!.base;

  @override
  AppSerif copyWith({TextStyle? base}) => AppSerif(base ?? this.base);

  @override
  AppSerif lerp(ThemeExtension<AppSerif>? other, double t) => this;
}
