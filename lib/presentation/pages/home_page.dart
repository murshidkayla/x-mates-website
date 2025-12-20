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

    // Responsive gradient stops based on screen size and orientation
    final size = MediaQuery.of(context).size;
    final isMobile = size.width <= 768;
    final isTablet = size.width > 768 && size.width <= 1024;
    final isLandscape = size.width > size.height;
    
    // Adjust gradient stops based on device and orientation
    // Blue at top, white at bottom
    List<double> gradientStops;
    if (isLandscape) {
      // Landscape: more gradual transition
      gradientStops = const [0.0, 0.5, 1.0];
    } else if (isMobile) {
      // Mobile portrait: keep more blue at top
      gradientStops = const [0.0, 0.35, 1.0];
    } else if (isTablet) {
      // Tablet portrait: balanced transition
      gradientStops = const [0.0, 0.4, 1.0];
    } else {
      // Desktop: standard transition
      gradientStops = const [0.0, 0.4, 1.0];
    }

    return Scaffold(
      backgroundColor: AppTheme.lightBackground,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.primaryColor,
              child: const PandoraNavbar(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor,
                    AppTheme.lightBackground,
                  ],
                  stops: gradientStops,
                ),
              ),
              child: AnimatedSection(
                delay: const Duration(milliseconds: 100),
                child: _EnhancedHeroSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 300),
                child: _StatsSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 500),
                child: _SafetyGuidelinesSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.lightBackground,
              child: AnimatedSection(
                delay: const Duration(milliseconds: 700),
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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: isMobile ? 100 : 140,
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
                // Image first on mobile
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 400,
                    ),
                    child: Image.asset(
                      'assets/Hand and iPhone 16 Pro.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Text content
                _HeroTextContent(isMobile: isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image on the left
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
                SizedBox(width: 60),
                // Text content on the right
                Expanded(
                  flex: 1,
                  child: _HeroTextContent(isMobile: isMobile),
                ),
              ],
            ),
          SizedBox(height: isMobile ? 64 : 88),
          // Premium CTA button with enhanced styling
          Center(
            child: PandoraButton(
            label: 'Get Started',
            isLarge: true,
              icon: Icons.chat_rounded,
            onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
          ),
          ),
          SizedBox(height: isMobile ? 48 : 64),
          // Trust indicators
          if (isMobile)
            Column(
        children: [
                _TrustIndicator(
                  icon: Icons.verified_rounded,
                  text: 'Verified',
                  isMobile: isMobile,
                ),
                SizedBox(height: 16),
                _TrustIndicator(
                  icon: Icons.lock_rounded,
                  text: '100% Confidential',
                  isMobile: isMobile,
                ),
                SizedBox(height: 16),
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
                SizedBox(width: 32),
                _TrustIndicator(
                  icon: Icons.lock_rounded,
                  text: '100% Confidential',
                  isMobile: isMobile,
                ),
                SizedBox(width: 32),
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
        color: AppTheme.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isMobile ? 16 : 18,
                  color: AppTheme.primaryColor,
          ),
          SizedBox(width: 8),
              Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: isMobile ? 13 : 15,
                  fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                  letterSpacing: 0.2,
                ),
          ),
        ],
      ),
    );
  }
}

// Ultra-Modern Stats Section
class _StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    final stats = [
      {'number': '50K+', 'label': 'Connections', 'icon': Icons.people_rounded},
      {'number': '24/7', 'label': 'Available', 'icon': Icons.access_time_rounded},
      {'number': '100%', 'label': 'Confidential', 'icon': Icons.lock_rounded},
      {'number': '98%', 'label': 'Satisfaction', 'icon': Icons.favorite_rounded},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: isMobile ? 60 : 100,
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
                'Trusted by Many',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 28 : 40,
                      color: AppTheme.textPrimary,
                      letterSpacing: -1,
                    ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 48 : 72),
          GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: isMobile ? 16 : 24,
              mainAxisSpacing: isMobile ? 16 : 24,
              childAspectRatio: isMobile ? 1.0 : 1.15,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 400 + (index * 100)),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: 0.8 + (0.2 * value),
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                ),
              );
            },
            child: ModernChatCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
          Container(
            width: isMobile ? 56 : 64,
            height: isMobile ? 56 : 64,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primaryColor.withOpacity(0.15),
                  AppTheme.primaryColorLight.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.primaryColor.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: Icon(
              stat['icon'] as IconData,
              color: AppTheme.primaryColor,
              size: isMobile ? 28 : 32,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Flexible(
            child: Text(
              stat['number'] as String,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 24 : 36,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Flexible(
            child: Text(
              stat['label'] as String,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
                fontSize: isMobile ? 12 : 15,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
            ),
          );
        },
      ),
        ],
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
        vertical: isMobile ? 60 : 100,
      ),
      child: ModernChatCard(
        backgroundColor: AppTheme.lightSurface,
        padding: EdgeInsets.all(isMobile ? 28 : 40),
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
            SizedBox(height: isMobile ? 20 : 28),
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
            SizedBox(height: isMobile ? 20 : 24),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 650,
              ),
              child: Text(
                'Join our waitlist and be among the first to experience compassionate support and meaningful connections. Your journey to peace and wellbeing starts here.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      height: 1.7,
                      color: AppTheme.textSecondary,
                      letterSpacing: 0.2,
                  ),
              textAlign: TextAlign.center,
            ),
            ),
            SizedBox(height: isMobile ? 36 : 48),
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

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
    );
    _shadowAnimation = Tween<double>(begin: 0.08, end: 0.15).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
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
      },
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
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
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 20 : 40),
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
                      padding: EdgeInsets.only(bottom: isMobile ? 12 : 16),
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
          SizedBox(height: isMobile ? 20 : 40),
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
        SizedBox(height: isMobile ? 32 : 40),
        // Premium description with better styling
                    Text(
          'Connect with compassionate listeners who understand. Share your thoughts, release your stress, and find calm through meaningful connections.',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 18 : 22,
                height: 1.8,
                fontWeight: FontWeight.w400,
                            color: AppTheme.textSecondary,
                letterSpacing: 0.3,
                          ),
                    ),
                  ],
    );
  }
}


