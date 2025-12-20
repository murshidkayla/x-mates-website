import 'package:flutter/material.dart';

class AppTheme {
  // Clean Standard Color Palette - White and #65C7DB
  static const Color primaryColor = Color(0xFF65C7DB); // Primary brand color
  static const Color primaryColorLight = Color(0xFF7DD3E5);
  static const Color primaryColorDark = Color(0xFF4FB8CC);
  
  // Light Mode Colors - Clean & Standard
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceElevated = Color(0xFFF8F9FA);
  static const Color lightSurfaceVariant = Color(0xFFF1F3F5);
  static const Color lightTextPrimary = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextTertiary = Color(0xFF9CA3AF);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color lightDivider = Color(0xFFF3F4F6);
  
  // Dark Mode Colors - Clean Dark Theme
  static const Color darkBackground = Color(0xFF111827);
  static const Color darkSurface = Color(0xFF1F2937);
  static const Color darkSurfaceElevated = Color(0xFF374151);
  static const Color darkSurfaceVariant = Color(0xFF4B5563);
  static const Color darkTextPrimary = Color(0xFFF9FAFB);
  static const Color darkTextSecondary = Color(0xFFD1D5DB);
  static const Color darkTextTertiary = Color(0xFF9CA3AF);
  static const Color darkBorder = Color(0xFF374151);
  static const Color darkDivider = Color(0xFF374151);
  
  // Additional Color Properties for Compatibility
  static const Color primaryBlack = Color(0xFF1A1A1A);
  static const Color darkGray = Color(0xFF6B7280);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color borderLight = Color(0xFFE5E7EB);
  
  // Legacy compatibility - map old names to new colors
  static const Color accentBlue = primaryColor;
  static const Color accentBlueLight = primaryColorLight;
  static const Color accentBlueLighter = Color(0xFF95DEE9);
  static const Color accentBlueDark = primaryColorDark;
  static const Color accentBlueDarker = Color(0xFF3AA5B8);
  
  // Accent Colors - Simple and Clean
  static const Color accentPurple = Color(0xFF9333EA);
  static const Color accentPink = Color(0xFFEC4899);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentOrange = Color(0xFFF59E0B);
  static const Color accentYellow = Color(0xFFFCD34D);
  
  // Extraordinary Gradients - Ultra Modern
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryColorLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFFFFF),
    ],
  );
  
  // Glassmorphism Helper Methods
  static BoxDecoration glassDecoration({
    Color? baseColor,
    double opacity = 0.2,
    double borderOpacity = 0.3,
    double borderRadius = 24,
  }) {
    return BoxDecoration(
      color: (baseColor ?? lightSurface).withOpacity(opacity),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: Colors.white.withOpacity(borderOpacity),
        width: 1.5,
      ),
      boxShadow: glassShadow,
    );
  }
  
  // Neon Text Effect Helper
  static List<Shadow> neonTextShadow(Color color, {double intensity = 1.0}) {
    return [
      Shadow(
        color: color.withOpacity(0.8 * intensity),
        blurRadius: 10 * intensity,
      ),
      Shadow(
        color: color.withOpacity(0.6 * intensity),
        blurRadius: 20 * intensity,
      ),
      Shadow(
        color: color.withOpacity(0.4 * intensity),
        blurRadius: 30 * intensity,
      ),
    ];
  }
  
  static const LinearGradient meshGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1),
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
      Color(0xFF00F5FF),
    ],
    stops: [0.0, 0.33, 0.66, 1.0],
  );
  
  static const RadialGradient radialGradient = RadialGradient(
    colors: [
      Color(0xFF6366F1),
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
    ],
    center: Alignment.topLeft,
    radius: 1.5,
  );
  
  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x40FFFFFF),
      Color(0x20FFFFFF),
    ],
  );
  
  // Advanced Shadow Presets
  static List<BoxShadow> get neonShadow => [
    BoxShadow(
      color: accentBlue.withOpacity(0.4),
      blurRadius: 20,
      spreadRadius: 0,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: primaryColor.withOpacity(0.2),
      blurRadius: 40,
      spreadRadius: -10,
      offset: const Offset(0, 16),
    ),
  ];
  
  static List<BoxShadow> get glassShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      spreadRadius: -5,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      blurRadius: 20,
      spreadRadius: -5,
      offset: const Offset(0, -5),
    ),
  ];
  
  static List<BoxShadow> get depthShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.03),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.01),
      blurRadius: 30,
      offset: const Offset(0, 12),
    ),
  ];

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColorLight,
        tertiary: primaryColorDark,
        surface: lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightTextPrimary,
        background: lightBackground,
        error: accentPink,
        outline: lightBorder,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: lightTextPrimary,
          fontSize: 72,
          fontWeight: FontWeight.w800,
          letterSpacing: -3,
          height: 1.1,
          fontFamily: 'System',
        ),
        displayMedium: TextStyle(
          color: lightTextPrimary,
          fontSize: 56,
          fontWeight: FontWeight.w700,
          letterSpacing: -2,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          color: lightTextPrimary,
          fontSize: 44,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5,
          height: 1.3,
        ),
        headlineLarge: TextStyle(
          color: lightTextPrimary,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          height: 1.3,
        ),
        headlineMedium: TextStyle(
          color: lightTextPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          height: 1.4,
        ),
        headlineSmall: TextStyle(
          color: lightTextPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          height: 1.4,
        ),
        titleLarge: TextStyle(
          color: lightTextPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        titleMedium: TextStyle(
          color: lightTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        titleSmall: TextStyle(
          color: lightTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        bodyLarge: TextStyle(
          color: lightTextSecondary,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.7,
          letterSpacing: 0,
        ),
        bodyMedium: TextStyle(
          color: lightTextSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0,
        ),
        bodySmall: TextStyle(
          color: lightTextTertiary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0,
        ),
        labelLarge: TextStyle(
          color: lightTextPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        labelMedium: TextStyle(
          color: lightTextSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          color: lightTextTertiary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: lightSurface,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: lightBorder,
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentBlue,
          side: BorderSide(
            color: accentBlue,
            width: 2.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: lightBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: lightBorder,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: accentBlue,
            width: 3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: accentPink,
            width: 2.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryColorLight,
        tertiary: primaryColorDark,
        surface: darkSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkTextPrimary,
        background: darkBackground,
        error: accentPink,
        outline: darkBorder,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: darkTextPrimary,
          fontSize: 72,
          fontWeight: FontWeight.w800,
          letterSpacing: -3,
          height: 1.1,
        ),
        displayMedium: TextStyle(
          color: darkTextPrimary,
          fontSize: 56,
          fontWeight: FontWeight.w700,
          letterSpacing: -2,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          color: darkTextPrimary,
          fontSize: 44,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5,
          height: 1.3,
        ),
        headlineLarge: TextStyle(
          color: darkTextPrimary,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          height: 1.3,
        ),
        headlineMedium: TextStyle(
          color: darkTextPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          height: 1.4,
        ),
        headlineSmall: TextStyle(
          color: darkTextPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          height: 1.4,
        ),
        titleLarge: TextStyle(
          color: darkTextPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        titleMedium: TextStyle(
          color: darkTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        titleSmall: TextStyle(
          color: darkTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.5,
        ),
        bodyLarge: TextStyle(
          color: darkTextSecondary,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.7,
          letterSpacing: 0,
        ),
        bodyMedium: TextStyle(
          color: darkTextSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0,
        ),
        bodySmall: TextStyle(
          color: darkTextTertiary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0,
        ),
        labelLarge: TextStyle(
          color: darkTextPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        labelMedium: TextStyle(
          color: darkTextSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          color: darkTextTertiary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: darkBorder,
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentBlue,
          side: BorderSide(
            color: accentBlue,
            width: 2.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: darkBorder.withOpacity(0.6),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: darkBorder.withOpacity(0.6),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: accentBlue,
            width: 3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: accentPink,
            width: 2.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
    );
  }
}
