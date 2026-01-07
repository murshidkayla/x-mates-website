import 'package:flutter/material.dart';

/// Responsive utility class for consistent breakpoints across the app
class Responsive {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Screen size getters
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static bool isMobileOrTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  // Responsive value getter
  static T value<T>(BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return desktop;
  }

  // Responsive padding
  static EdgeInsets padding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: value(
        context,
        mobile: 20.0,
        tablet: 40.0,
        desktop: 80.0,
      ),
    );
  }

  static EdgeInsets sectionPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: value(
        context,
        mobile: 20.0,
        tablet: 40.0,
        desktop: 80.0,
      ),
      vertical: value(
        context,
        mobile: 40.0,
        tablet: 60.0,
        desktop: 80.0,
      ),
    );
  }

  // Responsive font sizes
  static double fontSize(BuildContext context, {
    required double mobile,
    double? tablet,
    required double desktop,
  }) {
    return value(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.2,
      desktop: desktop,
    );
  }

  // Responsive spacing
  static double spacing(BuildContext context, {
    required double mobile,
    double? tablet,
    required double desktop,
  }) {
    return value(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.3,
      desktop: desktop,
    );
  }

  // Get screen width
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Max content width
  static double maxContentWidth(BuildContext context) {
    return value(
      context,
      mobile: double.infinity,
      tablet: 900.0,
      desktop: 1200.0,
    );
  }
}




