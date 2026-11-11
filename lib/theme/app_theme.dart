import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Minimal Swiss-editorial palette: warm off-white, near-black ink,
/// hairline rules, one yellow accent.
class AppColors {
  static const Color paper = Color(0xFFF3F1EA);
  static const Color card = Color(0xFFF8F7F2);
  static const Color ink = Color(0xFF17150F);
  static const Color muted = Color(0xFF6F6A5D);
  static const Color faint = Color(0xFFA39D8D);
  static const Color line = Color(0xFFDDD8C8);
  static const Color accent = Color(0xFFE8B81B);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.paper,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        primary: AppColors.ink,
        surface: AppColors.paper,
        brightness: Brightness.light,
      ),
      dividerColor: AppColors.line,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.ink,
      ),
      extensions: [AppDisplay(GoogleFonts.archivo()), AppMono(GoogleFonts.ibmPlexMono())],
    );
  }
}

/// Grotesque display face for headlines and titles.
class AppDisplay extends ThemeExtension<AppDisplay> {
  final TextStyle base;
  const AppDisplay(this.base);

  static TextStyle of(BuildContext context) =>
      Theme.of(context).extension<AppDisplay>()!.base;

  @override
  AppDisplay copyWith({TextStyle? base}) => AppDisplay(base ?? this.base);

  @override
  AppDisplay lerp(ThemeExtension<AppDisplay>? other, double t) => this;
}

/// Monospace face for labels, metadata and code snippets.
class AppMono extends ThemeExtension<AppMono> {
  final TextStyle base;
  const AppMono(this.base);

  static TextStyle of(BuildContext context) =>
      Theme.of(context).extension<AppMono>()!.base;

  @override
  AppMono copyWith({TextStyle? base}) => AppMono(base ?? this.base);

  @override
  AppMono lerp(ThemeExtension<AppMono>? other, double t) => this;
}
