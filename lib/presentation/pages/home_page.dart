import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/pandora_button.dart';
import '../widgets/modern_chat_card.dart';
import '../widgets/footer.dart';
import '../widgets/animated_section.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/');
    });

    return Scaffold(
      backgroundColor: AppTheme.lightBackground,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.primaryColor,
              child: Column(
                children: [
                  const PandoraNavbar(),
                  AnimatedSection(
                    delay: Duration.zero,
                    child: _EnhancedHeroSection(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 100),
                child: _SafetyGuidelinesSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 150),
                child: _AppShowcaseSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 200),
                child: _CTASection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: const Footer(),
            ),
          ),
        ],
      ),
    );
  }
}

// Ultra-Modern Hero Section
class _EnhancedHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Container(
      padding: EdgeInsets.only(
        left: isMobile ? 24 : 140,
        right: isMobile ? 24 : 140,
        top: isMobile ? 60 : 80,
        bottom: isMobile ? 40 : 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Text side by side on desktop, stacked on mobile
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text content first on mobile
                _HeroTextContent(isMobile: isMobile),
                SizedBox(height: 32),
                // Image below text on mobile with 3D effect
                Center(
                  child: _ThreeDPhoneImage(
                    imagePath: 'assets/Hand and iPhone 16 Pro.png',
                    maxWidth: 300,
                    maxHeight: 400,
                  ),
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text content on the left
                Expanded(
                  flex: 1,
                  child: _HeroTextContent(isMobile: isMobile),
                ),
                SizedBox(width: 48),
                // Image on the right, aligned to bottom
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 600,
                    ),
                    child: Image.asset(
                      'assets/Hand and iPhone 16 Pro.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: isMobile ? 40 : 56),
   
          // Trust indicators
          if (isMobile)
            Column(
              children: [
                _TrustIndicator(
                  icon: Icons.verified_rounded,
                  text: 'Verified',
                  isMobile: isMobile,
                ),
                SizedBox(height: 12),
                _TrustIndicator(
                  icon: Icons.lock_rounded,
                  text: '100% Confidential',
                  isMobile: isMobile,
                ),
                SizedBox(height: 12),
                _TrustIndicator(
                  icon: Icons.access_time_rounded,
                  text: '24/7 Available',
                  isMobile: isMobile,
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TrustIndicator(
                  icon: Icons.verified_rounded,
                  text: 'Verified',
                  isMobile: isMobile,
                ),
                SizedBox(width: 24),
                _TrustIndicator(
                  icon: Icons.lock_rounded,
                  text: '100% Confidential',
                  isMobile: isMobile,
                ),
                SizedBox(width: 24),
                _TrustIndicator(
                  icon: Icons.access_time_rounded,
                  text: '24/7 Available',
                  isMobile: isMobile,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TrustIndicator extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isMobile;

  const _TrustIndicator({
    required this.icon,
    required this.text,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 8 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isMobile ? 16 : 18,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: isMobile ? 13 : 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
          ),
        ],
      ),
    );
  }
}

// App Showcase Section with iPhone
class _AppShowcaseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: isMobile ? 48 : 72,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColorLight,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Experience the App',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 28 : 40,
                      color: AppTheme.textPrimary,
                      letterSpacing: -1,
                    ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 32 : 48),
          if (isMobile)
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 500,
                  ),
                  child: Image.asset(
                    'assets/iPhone 16.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 32),
                _AppShowcaseContent(isMobile: isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 700,
                    ),
                    child: Image.asset(
                      'assets/iPhone 16.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 48),
                Expanded(
                  flex: 1,
                  child: _AppShowcaseContent(isMobile: isMobile),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _AppShowcaseContent extends StatelessWidget {
  final bool isMobile;

  const _AppShowcaseContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Voice Deserves to Be Heard',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: isMobile ? 24 : 36,
                color: AppTheme.textPrimary,
                letterSpacing: -1,
                height: 1.2,
              ),
        ),
        SizedBox(height: isMobile ? 16 : 24),
        Text(
          'Connect with compassionate listeners who understand. Our app makes it easy to find someone who\'s here to listen, anytime, anywhere.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 16 : 18,
                height: 1.6,
                color: AppTheme.textSecondary,
                letterSpacing: 0.2,
              ),
        ),
        SizedBox(height: isMobile ? 20 : 28),
        _FeatureItem(
          icon: Icons.phone_rounded,
          title: 'Voice & Video Calls',
          description: 'Connect through voice or video calls with verified listeners',
          isMobile: isMobile,
        ),
        SizedBox(height: isMobile ? 14 : 18),
        _FeatureItem(
          icon: Icons.chat_bubble_rounded,
          title: 'Instant Messaging',
          description: 'Chat with compassionate listeners in real-time',
          isMobile: isMobile,
        ),
        SizedBox(height: isMobile ? 14 : 18),
        _FeatureItem(
          icon: Icons.verified_user_rounded,
          title: 'Verified Listeners',
          description: 'All our listeners are verified and trained to provide support',
          isMobile: isMobile,
        ),
      ],
    );
  }
}

class _FeatureItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  State<_FeatureItem> createState() => _FeatureItemState();
}

class _FeatureItemState extends State<_FeatureItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconScaleAnimation;
  bool _isHovered = false;
  double _rotationX = 0.0;
  double _rotationY = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _iconScaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateRotation(Offset position, Size size) {
    setState(() {
      final centerX = size.width / 2;
      final centerY = size.height / 2;
      _rotationY = (position.dx - centerX) / centerX * 0.1;
      _rotationX = -(position.dy - centerY) / centerY * 0.1;
    });
  }

  void _resetRotation() {
    setState(() {
      _rotationX = 0.0;
      _rotationY = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
        _resetRotation();
      },
      onHover: (event) {
        if (_isHovered) {
          _updateRotation(event.localPosition, context.size ?? Size.zero);
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_rotationX)
              ..rotateY(_rotationY)
              ..scale(_scaleAnimation.value),
            alignment: FractionalOffset.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: _iconScaleAnimation.value,
                  child: Container(
                    width: widget.isMobile ? 48 : 56,
                    height: widget.isMobile ? 48 : 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: _isHovered
                            ? [
                                AppTheme.primaryColor,
                                AppTheme.primaryColorLight,
                              ]
                            : [
                                AppTheme.primaryColor.withOpacity(0.15),
                                AppTheme.primaryColorLight.withOpacity(0.1),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: _isHovered
                            ? AppTheme.primaryColor
                            : AppTheme.primaryColor.withOpacity(0.2),
                        width: _isHovered ? 2 : 1.5,
                      ),
                      boxShadow: _isHovered
                          ? [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      widget.icon,
                      color: _isHovered ? Colors.white : AppTheme.primaryColor,
                      size: widget.isMobile ? 24 : 28,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: widget.isMobile ? 16 : 18,
                              color: _isHovered
                                  ? AppTheme.primaryColor
                                  : AppTheme.textPrimary,
                            ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: widget.isMobile ? 14 : 15,
                              color: AppTheme.textSecondary,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Ultra-Modern CTA Section
class _CTASection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: isMobile ? 48 : 72,
      ),
      child: ModernChatCard(
        backgroundColor: AppTheme.lightSurface,
        padding: EdgeInsets.all(isMobile ? 24 : 36),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 20,
                vertical: isMobile ? 8 : 10,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Text(
                'Get Started Today',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 12 : 14,
                      letterSpacing: 0.5,
                    ),
              ),
            ),
            SizedBox(height: isMobile ? 16 : 24),
            Text(
              'Ready to Find Relief?',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: isMobile ? 32 : 44,
                    color: AppTheme.textPrimary,
                    letterSpacing: -1.5,
                    height: 1.2,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile ? 16 : 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 650,
              ),
              child: Text(
                'Join our waitlist and be among the first to experience compassionate support and meaningful connections. Your journey to peace and wellbeing starts here.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      height: 1.6,
                      color: AppTheme.textSecondary,
                      letterSpacing: 0.2,
                  ),
              textAlign: TextAlign.center,
            ),
            ),
            SizedBox(height: isMobile ? 28 : 40),
            PandoraButton(
              label: 'Start Your Journey',
              isLarge: true,
              icon: Icons.chat_rounded,
              onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
            ),
          ],
        ),
      ),
    );
  }
}

// Safety Guidelines Section - Chat Style
// Animated Guideline Card with Hover Effect
class _AnimatedGuidelineCard extends StatefulWidget {
  final String guideline;
  final int index;
  final bool isMobile;
  final double screenWidth;
  final double widthPercentage;

  const _AnimatedGuidelineCard({
    required this.guideline,
    required this.index,
    required this.isMobile,
    required this.screenWidth,
    required this.widthPercentage,
  });

  @override
  State<_AnimatedGuidelineCard> createState() => _AnimatedGuidelineCardState();
}

class _AnimatedGuidelineCardState extends State<_AnimatedGuidelineCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isHovered = false;
  double _rotationX = 0.0;
  double _rotationY = 0.0;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
    );
    _shadowAnimation = Tween<double>(begin: 0.08, end: 0.2).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _updateRotation(Offset position, Size size) {
    setState(() {
      final centerX = size.width / 2;
      final centerY = size.height / 2;
      _rotationY = (position.dx - centerX) / centerX * 0.15;
      _rotationX = -(position.dy - centerY) / centerY * 0.15;
    });
  }

  void _resetRotation() {
    setState(() {
      _rotationX = 0.0;
      _rotationY = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
        _resetRotation();
      },
      onHover: (event) {
        if (_isHovered) {
          _updateRotation(event.localPosition, context.size ?? Size.zero);
        }
      },
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_rotationX)
              ..rotateY(_rotationY)
              ..scale(_scaleAnimation.value),
            alignment: FractionalOffset.center,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: (widget.screenWidth - (widget.isMobile ? 40 : 160)) *
                    widget.widthPercentage,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: widget.isMobile ? 18 : 22,
                vertical: widget.isMobile ? 14 : 18,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_shadowAnimation.value),
                    blurRadius: _isHovered ? 20 : 12,
                    offset: Offset(0, _isHovered ? 4 : 2),
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                  if (_isHovered)
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                ],
              ),
              child: Text(
                widget.guideline,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: widget.isMobile ? 15 : 17,
                      fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                      color: _isHovered ? AppTheme.primaryColor : Colors.black87,
                      height: 1.5,
                      letterSpacing: 0.1,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SafetyGuidelinesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    final screenWidth = MediaQuery.of(context).size.width;

    final guidelines = [
      'Stay safe, stay kind every call matters.',
      'Talk nice, talk real respect makes every call better.',
      'Talk freely, but stay smart no personal info needed.',
      'We value your safety never send money or personal info.',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: isMobile ? 48 : 72,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 16 : 32),
          ...guidelines.asMap().entries.map((entry) {
            final index = entry.key;
            final guideline = entry.value;
            // Progressive width: 60%, 70%, 80%, 90%
            final widthPercentage = 0.6 + (index * 0.1);
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 600 + (index * 100)),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(-30 * (1 - value), 0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isMobile ? 10 : 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _AnimatedGuidelineCard(
                          guideline: guideline,
                          index: index,
                          isMobile: isMobile,
                          screenWidth: screenWidth,
                          widthPercentage: widthPercentage,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
          SizedBox(height: isMobile ? 16 : 32),
        ],
      ),
    );
  }
}


// Hero Text Content Widget
class _HeroTextContent extends StatelessWidget {
  final bool isMobile;

  const _HeroTextContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Massive headline with modern typography
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                      'Find peace through',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: isMobile ? 40 : 64,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                            letterSpacing: -2.5,
                            color: AppTheme.lightTextPrimary,
                          ),
                    ),
                    SizedBox(height: isMobile ? 12 : 16),
                    Text(
                      'meaningful connections',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: isMobile ? 40 : 64,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                            letterSpacing: -2.5,
                            color: Colors.white.withOpacity(0.85),
                          ),
                    ),
        ],
      ),
            ),
          );
        },
      ),
        SizedBox(height: isMobile ? 24 : 32),
        // Premium description with better styling
                    Text(
          'Connect with compassionate listeners who understand. Share your thoughts, release your stress, and find calm through meaningful connections.',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 18 : 22,
                height: 1.7,
                fontWeight: FontWeight.w400,
                            color: AppTheme.textSecondary,
                letterSpacing: 0.3,
                          ),
                    ),
                  ],
    );
  }
}

// 3D Interactive Phone Image with Tilt Effect
class _ThreeDPhoneImage extends StatefulWidget {
  final String imagePath;
  final double maxWidth;
  final double maxHeight;

  const _ThreeDPhoneImage({
    required this.imagePath,
    required this.maxWidth,
    required this.maxHeight,
  });

  @override
  State<_ThreeDPhoneImage> createState() => _ThreeDPhoneImageState();
}

class _ThreeDPhoneImageState extends State<_ThreeDPhoneImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatAnimation = Tween<double>(begin: -15.0, end: 15.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  void _updateRotation(Offset position, Size size) {
    setState(() {
      final centerX = size.width / 2;
      final centerY = size.height / 2;
      
      _rotationY = (position.dx - centerX) / centerX * 0.2;
      _rotationX = -(position.dy - centerY) / centerY * 0.2;
      _scale = 1.05;
    });
  }

  void _resetRotation() {
    setState(() {
      _rotationX = 0.0;
      _rotationY = 0.0;
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _updateRotation(event.localPosition, context.size ?? Size.zero),
      onExit: (_) => _resetRotation(),
      child: AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateX(_rotationX)
              ..rotateY(_rotationY)
              ..scale(_scale)
              ..translate(0.0, _floatAnimation.value),
            alignment: FractionalOffset.center,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: widget.maxWidth,
                maxHeight: widget.maxHeight,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 40,
                    spreadRadius: 10,
                    offset: Offset(0, _floatAnimation.value * 0.5),
                  ),
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    blurRadius: 60,
                    spreadRadius: 20,
                    offset: Offset(0, _floatAnimation.value * 0.3),
                  ),
                ],
              ),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Animated Background Particles
class _AnimatedBackgroundParticles extends StatefulWidget {
  @override
  State<_AnimatedBackgroundParticles> createState() => _AnimatedBackgroundParticlesState();
}

class _AnimatedBackgroundParticlesState extends State<_AnimatedBackgroundParticles>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      8,
      (index) => AnimationController(
        duration: Duration(milliseconds: 4000 + (index * 500)),
        vsync: this,
      )..repeat(),
    );
    
    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: Listenable.merge(_animations),
        builder: (context, child) {
          return CustomPaint(
            painter: _ParticlesPainter(_animations),
          );
        },
      ),
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  final List<Animation<double>> animations;

  _ParticlesPainter(this.animations);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    // Animated floating particles/circles
    for (int i = 0; i < animations.length; i++) {
      final progress = animations[i].value;
      final offset = Offset(
        size.width * (0.1 + (i * 0.12)) +
            (80 * (i % 2 == 0 ? 1 : -1) * (progress - 0.5)),
        size.height * (0.15 + (i * 0.1)) +
            (50 * (i % 3 == 0 ? 1 : -1) * (progress - 0.5)),
      );
      final radius = 60 + (40 * (0.5 - (progress - 0.5).abs()));

      paint.color = Colors.white.withOpacity(0.05 + (0.03 * progress));
      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

