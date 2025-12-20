import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  final List<Color>? colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
    
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
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
      AppTheme.accentBlue.withOpacity(0.1),
      AppTheme.primaryColor.withOpacity(0.06),
      AppTheme.primaryColorLight.withOpacity(0.04),
      AppTheme.accentBlue.withOpacity(0.1),
    ];

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: widget.begin,
              end: widget.end,
              colors: colors,
              stops: [
                0.0 + (_animation.value * 0.2),
                0.33 + (_animation.value * 0.2),
                0.66 + (_animation.value * 0.2),
                1.0 + (_animation.value * 0.2),
              ].map((e) => e % 1.0).toList(),
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _FloatingParticles(),
              ),
              widget.child,
            ],
          ),
        );
      },
    );
  }
}

class _FloatingParticles extends StatefulWidget {
  @override
  State<_FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<_FloatingParticles>
    with TickerProviderStateMixin {
  late List<_Particle> _particles;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    
    _particles = List.generate(15, (index) => _Particle.random());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _ParticlesPainter(_particles, _controller.value),
              size: Size(constraints.maxWidth, constraints.maxHeight),
            );
          },
        );
      },
    );
  }
}

class _Particle {
  final Offset position;
  final double radius;
  final Color color;
  final double speed;
  final double angle;

  _Particle({
    required this.position,
    required this.radius,
    required this.color,
    required this.speed,
    required this.angle,
  });

  factory _Particle.random() {
    final random = math.Random();
    final colors = [
      AppTheme.accentBlue.withOpacity(0.15),
      AppTheme.primaryColor.withOpacity(0.1),
      AppTheme.primaryColorLight.withOpacity(0.08),
    ];
    
    return _Particle(
      position: Offset(
        random.nextDouble() * 100,
        random.nextDouble() * 100,
      ),
      radius: 2 + random.nextDouble() * 4,
      color: colors[random.nextInt(colors.length)],
      speed: 0.2 + random.nextDouble() * 0.3,
      angle: random.nextDouble() * 2 * math.pi,
    );
  }

  _Particle move(double delta) {
    final newX = position.dx + math.cos(angle) * speed * delta * 50;
    final newY = position.dy + math.sin(angle) * speed * delta * 50;
    
    return _Particle(
      position: Offset(newX % 100, newY % 100),
      radius: radius,
      color: color,
      speed: speed,
      angle: angle,
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  final double animationValue;

  _ParticlesPainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final movedParticle = particle.move(animationValue);
      final paint = Paint()
        ..color = movedParticle.color
        ..style = PaintingStyle.fill;
      
      final x = (movedParticle.position.dx / 100) * size.width;
      final y = (movedParticle.position.dy / 100) * size.height;
      
      canvas.drawCircle(Offset(x, y), movedParticle.radius, paint);
      
      // Add glow effect
      final glowPaint = Paint()
        ..color = movedParticle.color.withOpacity(0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(Offset(x, y), movedParticle.radius * 2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(_ParticlesPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

