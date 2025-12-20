import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedGradientOrb extends StatefulWidget {
  final double size;
  final Offset position;
  final List<Color>? colors;
  final Duration duration;

  const AnimatedGradientOrb({
    super.key,
    required this.size,
    required this.position,
    this.colors,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<AnimatedGradientOrb> createState() => _AnimatedGradientOrbState();
}

class _AnimatedGradientOrbState extends State<AnimatedGradientOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors ?? [
      AppTheme.primaryColor,
      AppTheme.primaryColorLight,
    ];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: widget.position.dx,
          top: widget.position.dy,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: colors,
                    stops: const [0.0, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors[0].withOpacity(0.4),
                      blurRadius: widget.size * 0.5,
                      spreadRadius: widget.size * 0.2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

