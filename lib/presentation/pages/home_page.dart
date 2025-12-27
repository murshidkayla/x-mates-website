import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../../appimages/images.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/');
    });

    return Scaffold(
      body: Stack(
        children: [
          // Fixed background gradient - stays fixed while scrolling
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 1.0],
                    colors: [
                      const Color(0xFF65C7DB), // Blue at top
                      Colors.white, // White at bottom
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Scrollable content on top
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _TopBarWithLogo(),
              ),
              SliverToBoxAdapter(
                child: _EnhancedHeroSection(),
              ),
              // SliverToBoxAdapter(
              //   child: AnimatedSection(
              //     delay: const Duration(milliseconds: 100),
              //     child: _SafetyGuidelinesSection(),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: AnimatedSection(
              //     delay: const Duration(milliseconds: 150),
              //     child: _AvatarTextSection(),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: AnimatedSection(
              //     delay: const Duration(milliseconds: 175),
              //     child: _SpeechBubbleSection(),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: AnimatedSection(
              //     delay: const Duration(milliseconds: 200),
              //     child: _CTASection(),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: const Footer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Top Bar with Logo and Navbar
class _TopBarWithLogo extends StatelessWidget {
  const _TopBarWithLogo();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 120.0);
    final verticalPadding = isMobile ? 16.0 : 28.0;
    final logoSize = isMobile ? 80.0 : (isTablet ? 100.0 : 150.0);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: isMobile
          ? Column(
              children: [
                Image.asset(
                  Images.logo,
                  width: logoSize,
                  height: logoSize,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                const PandoraNavbar(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo on the left
                Image.asset(
                  Images.logo,
                  width: logoSize,
                  height: logoSize,
                  fit: BoxFit.contain,
                ),
                // Navbar on the right
                const Expanded(
                  child: PandoraNavbar(),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 140.0);
    final topPadding = isMobile ? 40.0 : (isTablet ? 60.0 : 80.0);
    final bottomPadding = isMobile ? 40.0 : 60.0;
    
    return Container(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile || isTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _HeroTextContent(),
                    const SizedBox(height: 32),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 400,
                        maxHeight: isMobile ? 300 : 400,
                      ),
                      child: Image.asset(
                        Images.phoneInHand,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text content on the left
                    Expanded(
                      flex: 1,
                      child: _HeroTextContent(),
                    ),
                    const SizedBox(width: 48),
                    // Image on the right, aligned to bottom
                    Expanded(
                      flex: 1,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500,
                          maxHeight: 600,
                        ),
                        child: Image.asset(
                          Images.phoneInHand,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// Hero Text Content Widget
class _HeroTextContent extends StatelessWidget {
  const _HeroTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 28.0 : (isTablet ? 40.0 : 64.0);
    final descriptionSize = isMobile ? 16.0 : (isTablet ? 18.0 : 22.0);
    final letterSpacing = isMobile ? -1.0 : (isTablet ? -1.5 : -2.5);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Massive headline with modern typography
        Text(
          'Find peace through',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: headlineSize,
                fontWeight: FontWeight.w900,
                height: 1.0,
                letterSpacing: letterSpacing,
                color: const Color.fromRGBO(227, 250, 255, 1), // rgba(227, 250, 255, 1)
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'meaningful connections',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: headlineSize,
                fontWeight: FontWeight.w900,
                height: 1.0,
                letterSpacing: letterSpacing,
                color: const Color.fromRGBO(227, 250, 255, 1), // rgba(227, 250, 255, 1)
              ),
        ),
        const SizedBox(height: 32),
        // Premium description with better styling
        Text(
          'Connect with compassionate listeners who understand. Share your thoughts, release your stress, and find calm through meaningful connections.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: descriptionSize,
                height: 1.7,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(227, 250, 255, 1), // rgba(227, 250, 255, 1)
                letterSpacing: 0.3,
              ),
        ),
      ],
    );
  }
}

