import 'package:flutter/material.dart';

// ─── Brand Colors ────────────────────────────────────────────────────────────
class AppColors {
  // Primary palette – deep indigo + coral accent
  static const Color primary = Color(0xFF4F46E5);       // Indigo
  static const Color primaryDark = Color(0xFF3730A3);
  static const Color primaryLight = Color(0xFFEEF2FF);

  static const Color accent = Color(0xFFFF6B6B);         // Coral
  static const Color accentGold = Color(0xFFFFB800);     // XP gold

  // Backgrounds
  static const Color bg = Color(0xFFF8F7FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceAlt = Color(0xFFF0EDFF);

  // Text
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Locked / disabled
  static const Color locked = Color(0xFFD1D5DB);
  static const Color lockedBg = Color(0xFFF9FAFB);

  // Chapter badge colors
  static const List<Color> chapterColors = [
    Color(0xFF4F46E5),
    Color(0xFF7C3AED),
    Color(0xFF0891B2),
    Color(0xFF059669),
  ];
}

// ─── Text Styles ─────────────────────────────────────────────────────────────
class AppTextStyles {
  static const String fontDisplay = 'Nunito';
  static const String fontBody = 'Nunito';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static const TextStyle headingLarge = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontBody,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontBody,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    letterSpacing: 0.3,
  );
}

// ─── Spacing ─────────────────────────────────────────────────────────────────
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

// ─── Radii ───────────────────────────────────────────────────────────────────
class AppRadius {
  static const double sm = 8;
  static const double md = 14;
  static const double lg = 20;
  static const double xl = 28;
  static const double full = 999;
}

// ─── Shadows ─────────────────────────────────────────────────────────────────
class AppShadows {
  static final card = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static final elevated = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.18),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static final button = [
    BoxShadow(
      color: AppColors.accent.withOpacity(0.35),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}

// ─── ThemeData ────────────────────────────────────────────────────────────────
class AppTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: AppTextStyles.fontBody,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.bg,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
          titleTextStyle: AppTextStyles.headingLarge,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            textStyle: AppTextStyles.labelLarge.copyWith(color: Colors.white),
          ),
        ),
        useMaterial3: true,
      );
}