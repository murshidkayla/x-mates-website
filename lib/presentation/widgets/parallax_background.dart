import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ParallaxBackground extends StatelessWidget {
  final Widget child;
  final double parallaxSpeed;

  const ParallaxBackground({
    super.key,
    required this.child,
    this.parallaxSpeed = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated gradient background
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primaryColor.withOpacity(0.05),
                  AppTheme.lightBackground,
                  AppTheme.primaryColorLight.withOpacity(0.03),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}



