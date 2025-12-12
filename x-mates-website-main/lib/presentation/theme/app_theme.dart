import 'package:flutter/material.dart';

class AppTheme {
  // Fresh Modern & Classy Color Palette
  static const Color primaryBlack = Color(0xFF000000); // Pure black
  static const Color darkGray = Color(0xFF1C1C1E); // Dark gray
  static const Color lightGray = Color(0xFFF5F5F7); // Light gray background
  static const Color accentBlue = Color(0xFF007AFF); // Vibrant blue
  static const Color accentPurple = Color(0xFF5856D6); // Rich purple
  static const Color accentPink = Color(0xFFFF2D55); // Energetic pink
  static const Color accentGreen = Color(0xFF34C759); // Fresh green
  static const Color surfaceWhite = Color(0xFFFFFFFF); // Pure white
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFFC7C7CC);
  static const Color borderLight    = Color(0xFFE5E5EA);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: accentBlue,
      scaffoldBackgroundColor: surfaceWhite,
      colorScheme: const ColorScheme.light(
        primary: accentBlue,
        secondary: accentPurple,
        surface: surfaceWhite,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceWhite,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textPrimary,
          fontSize: 72,
          fontWeight: FontWeight.w900,
          letterSpacing: -3,
          height: 1.0,
        ),
        displayMedium: TextStyle(
          color: textPrimary,
          fontSize: 56,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
          height: 1.1,
        ),
        displaySmall: TextStyle(
          color: textPrimary,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.5,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
        ),
        titleLarge: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        bodyLarge: TextStyle(
          color: textSecondary,
          fontSize: 19,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0.2,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0.1,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: const BorderSide(color: borderLight, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: accentBlue, width: 2),
        ),
        fillColor: lightGray,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelStyle: const TextStyle(
          color: textSecondary,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: textTertiary,
          fontSize: 17,
        ),
      ),
    );
  }
}
