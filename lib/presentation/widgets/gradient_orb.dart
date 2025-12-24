import 'dart:math' as math;
import 'package:flutter/material.dart';

class GradientOrb extends StatefulWidget {
  final double size;
  final Color color;
  final Offset position;
  final Duration duration;

  const GradientOrb({
    super.key,
    required this.size,
    required this.color,
    required this.position,
    this.duration = const Duration(seconds: 4),
  });

  @override
  State<GradientOrb> createState() => _GradientOrbState();
}

class _GradientOrbState extends State<GradientOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _moveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _moveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offsetX = math.sin(_moveAnimation.value * 2 * math.pi) * 30;
        final offsetY = math.cos(_moveAnimation.value * 2 * math.pi) * 20;

        return Positioned(
          left: widget.position.dx + offsetX,
          top: widget.position.dy + offsetY,
          child: Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    widget.color.withOpacity(0.4),
                    widget.color.withOpacity(0.2),
                    widget.color.withOpacity(0.0),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}





