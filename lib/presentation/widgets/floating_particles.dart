import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FloatingParticles extends StatefulWidget {
  final int particleCount;
  final Color? color;

  const FloatingParticles({
    super.key,
    this.particleCount = 30,
    this.color,
  });

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    for (int i = 0; i < widget.particleCount; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: 2 + _random.nextDouble() * 6,
        speed: 0.2 + _random.nextDouble() * 0.5,
        opacity: 0.1 + _random.nextDouble() * 0.3,
        color: widget.color ?? AppTheme.primaryColor,
      ));
    }
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
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            animationValue: _controller.value,
          ),
          child: SizedBox.expand(),
        );
      },
    );
  }
}

class _Particle {
  double x;
  double y;
  double size;
  double speed;
  double opacity;
  Color color;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
    required this.color,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double animationValue;

  _ParticlePainter({
    required this.particles,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final x = (particle.x + animationValue * particle.speed) % 1.0;
      final y = (particle.y + animationValue * particle.speed * 0.5) % 1.0;

      final paint = Paint()
        ..color = particle.color.withOpacity(particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(x * size.width, y * size.height),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) => true;
}



