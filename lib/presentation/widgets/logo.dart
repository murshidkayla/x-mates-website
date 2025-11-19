import 'package:flutter/material.dart';

class XMatezLogo extends StatelessWidget {
  final double size;
  final bool isDark;
  final Color? tintColor;

  const XMatezLogo({
    super.key,
    this.size = 120,
    this.isDark = false,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    // If on light background, use dark color. If on dark background, use white
    final color = tintColor ?? (isDark ? Colors.white : const Color(0xFF1a1a1a));
    
    return Image.asset(
      'assets/images/X Z  Png Files-01.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      color: color,
      colorBlendMode: BlendMode.srcIn,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'X',
              style: TextStyle(
                color: color,
                fontSize: size * 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Matez Text Logo Widget for small areas
class MatezTextLogo extends StatelessWidget {
  final double height;
  final bool isDark;
  final Color? tintColor;

  const MatezTextLogo({
    super.key,
    this.height = 24,
    this.isDark = false,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    // If on light background, use dark color. If on dark background, use white
    final color = tintColor ?? (isDark ? Colors.white : const Color(0xFF1a1a1a));
    
    return Image.asset(
      'assets/images/X Z  Png Files-02.png',
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      color: color,
      colorBlendMode: BlendMode.srcIn,
      errorBuilder: (context, error, stackTrace) {
        return Text(
          'Matez',
          style: TextStyle(
            color: color,
            fontSize: height * 0.8,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        );
      },
    );
  }
}
