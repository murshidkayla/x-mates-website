import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackgroundParticles extends StatefulWidget {
  final Widget child;
  final int particleCount;

  const AnimatedBackgroundParticles({
    super.key,
    required this.child,
    this.particleCount = 50,
  });

  @override
  State<AnimatedBackgroundParticles> createState() =>
      _AnimatedBackgroundParticlesState();
}

class _AnimatedBackgroundParticlesState
    extends State<AnimatedBackgroundParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Initialize particles
    final random = math.Random();
    for (int i = 0; i < widget.particleCount; i++) {
      _particles.add(Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: 2 + random.nextDouble() * 4,
        speed: 0.3 + random.nextDouble() * 0.7,
        opacity: 0.1 + random.nextDouble() * 0.3,
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
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: ParticlePainter(
                particles: _particles,
                animationValue: _controller.value,
              ),
              child: widget.child,
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class Particle {
  double x;
  double y;
  double size;
  double speed;
  double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      final x = (particle.x + math.sin(animationValue * 2 * math.pi * particle.speed) * 0.1) *
          size.width;
      final y = (particle.y + math.cos(animationValue * 2 * math.pi * particle.speed) * 0.1) *
          size.height;

      paint.color = AppTheme.accentBlue.withOpacity(particle.opacity);
      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}





