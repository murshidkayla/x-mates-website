import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1.0],
            colors: [
              const Color(0xFF65C7DB), // Blue at top
              const Color(0xFF65C7DB), // Single color at bottom
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _TopBarWithLogo(),
            ),
            SliverToBoxAdapter(
              child: _EnhancedHeroSection(),
            ),
            SliverToBoxAdapter(
              child: _iPhone16Section(),
            ),
            SliverToBoxAdapter(
              child: _CharacterSection(),
            ),
            SliverToBoxAdapter(
              child: _OrangeCTASection(),
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
      child: isMobile || isTablet
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

// iPhone 16 Section
class _iPhone16Section extends StatelessWidget {
  const _iPhone16Section();

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
      child: isMobile || isTablet
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 400,
                    maxHeight: isMobile ? 300 : 400,
                  ),
                  child: Image.asset(
                    Images.iPhone16,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 32),
                _iPhone16TextContent(),
                const SizedBox(height: 32),
                _iPhone16TextContent(),
              ],
            )
          : Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // iPhone image on the left
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                              maxHeight: 600,
                            ),
                            child: Image.asset(
                              Images.iPhone16,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Text below the phone
                          _iPhone16TextContent(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                    // Text content on the right
                    Expanded(
                      flex: 1,
                      child: _iPhone16TextContent(),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

// iPhone 16 Text Content Widget
class _iPhone16TextContent extends StatelessWidget {
  const _iPhone16TextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 24.0 : (isTablet ? 32.0 : 48.0);
    final descriptionSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Large bold italic heading
        Text(
          'FIND PEACE THROUGH\nMEANINGFUL CONNECTIONS',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: headlineSize,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -1.0,
            color: const Color.fromRGBO(227, 250, 255, 1), // rgba(227, 250, 255, 1)
          ),
        ),
        const SizedBox(height: 24),
        // Italic paragraph text
        Text(
          'Connect with compassionate listeners who understand. Share your thoughts, release your stress, and find calm through meaningful connections.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: descriptionSize,
            fontStyle: FontStyle.italic,
            height: 1.6,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(227, 250, 255, 1), // rgba(227, 250, 255, 1)
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// Character Section - Matching the image layout
class _CharacterSection extends StatelessWidget {
  const _CharacterSection();

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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Coin image on the side - larger and positioned to the right
          Positioned(
            top: isMobile ? -130 : (isTablet ? -190 : -250),
            right: isMobile ? -150 : (isTablet ? -220 : -300),
            child: Container(
              width: isMobile ? 180 : (isTablet ? 250 : 350),
              height: isMobile ? 180 : (isTablet ? 250 : 350),
              child: Image.asset(
                Images.coinXmate,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Main content
          isMobile || isTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Large character image
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? 250 : 350,
                        maxHeight: isMobile ? 250 : 350,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          Images.animeGirl1,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Two smaller character images
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: isMobile ? 120 : 160,
                            maxHeight: isMobile ? 120 : 160,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              Images.avatarGirl2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: isMobile ? 120 : 160,
                            maxHeight: isMobile ? 120 : 160,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              Images.avatarGirl3,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _CharacterSectionTextContent(),
                    const SizedBox(height: 32),
                    _SpeechBubbleWithCharacter(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side - Character images
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Large character image
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                              maxHeight: 400,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                Images.animeGirl1,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Two smaller character images
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 200,
                                    maxHeight: 200,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      Images.avatarGirl2,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 200,
                                    maxHeight: 200,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      Images.avatarGirl3,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                    // Right side - Text and speech bubble
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CharacterSectionTextContent(),
                          const SizedBox(height: 40),
                          _SpeechBubbleWithCharacter(),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// Character Section Text Content
class _CharacterSectionTextContent extends StatelessWidget {
  const _CharacterSectionTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 24.0 : (isTablet ? 32.0 : 48.0);
    final descriptionSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Large bold heading
        Text(
          'YOUR VOICE MATTERS\nYOUR STORY COUNTS',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: headlineSize,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -1.0,
            color: const Color(0xFF0A4A5C), // Dark teal/blue color
          ),
        ),
        const SizedBox(height: 24),
        // Paragraph text
        Text(
          'Every conversation is a step toward healing. Our community of empathetic listeners is here to support you on your journey to emotional wellness and inner peace.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: descriptionSize,
            fontStyle: FontStyle.italic,
            height: 1.6,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// Speech Bubble Clipper with Tail
class _SpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final borderRadius = 24.0;
    final tailWidth = 20.0;
    final tailHeight = 15.0;
    final tailOffset = size.width * 0.75; // Position tail on the right side

    // Main rounded rectangle
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ),
    );
    
    // Add tail pointing down and to the right
    path.moveTo(tailOffset, size.height);
    path.lineTo(tailOffset + tailWidth / 2, size.height + tailHeight);
    path.lineTo(tailOffset + tailWidth, size.height);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Speech Bubble with Character
class _SpeechBubbleWithCharacter extends StatelessWidget {
  const _SpeechBubbleWithCharacter();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final descriptionSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Speech bubble with tail
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: ClipPath(
            clipper: _SpeechBubbleClipper(),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Connect with compassionate listeners who understand. Share your thoughts, release your stress, and find calm through meaningful connections.',
                style: TextStyle(
                  fontSize: descriptionSize,
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
        // Character peeking from below
        Positioned(
          bottom: -320,
          right: 20,
          child: Container(
            width: isMobile ? 120 : (isTablet ? 160 : 200),
            height: isMobile ? 120 : (isTablet ? 160 : 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Images.avatarCartoon,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

// Orange CTA Section
class _OrangeCTASection extends StatelessWidget {
  const _OrangeCTASection();

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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main orange gradient card
          Container(
            padding: EdgeInsets.all(isMobile ? 24.0 : (isTablet ? 40.0 : 60.0)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0211, 0.2189, 0.5107, 1.0],
                colors: [
                  Color(0xFFFFDDBA), 
                  Color(0xFFFFDDBA), 
                  Color(0xFFFFDCB7), 
                  Color(0xFFFFBE82), 
                ],
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: isMobile || isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _OrangeCTATextContent(),
                          const SizedBox(height: 32),
                          _OrangeCTAActionContent(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side - Text content
                          Expanded(
                            flex: 1,
                            child: _OrangeCTATextContent(),
                          ),
                          const SizedBox(width: 48),
                          // Right side - Action content
                          Expanded(
                            flex: 1,
                            child: _OrangeCTAActionContent(),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}

// Orange CTA Text Content
class _OrangeCTATextContent extends StatelessWidget {
  const _OrangeCTATextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 24.0 : (isTablet ? 32.0 : 48.0);
    final descriptionSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Large bold orange title
        Text(
          'READY TO START YOUR\nJOURNEY TO PEACE',
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -1.0,
            color: Colors.orange.shade800,
          ),
        ),
        const SizedBox(height: 24),
        // Paragraph text
        Text(
          'Take the first step toward emotional wellness. Join our community of compassionate listeners and discover the power of meaningful connections.',
          style: TextStyle(
            fontSize: descriptionSize,
            fontStyle: FontStyle.italic,
            height: 1.6,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade900,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// Get Started Button with Animation
class _GetStartedButton extends StatefulWidget {
  const _GetStartedButton();

  @override
  State<_GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<_GetStartedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _pressController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _pressController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
    final verticalPadding = isMobile ? 14.0 : 18.0;
    final fontSize = isMobile ? 14.0 : (isTablet ? 15.0 : 16.0);
    
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/contact');
        Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/contact');
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFF8B17), // #FF8B17
                    Color(0xFFFFB367), // #FFB367
                  ],
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(201, 77, 0, _isPressed ? 0.5 : 0.75),
                    offset: Offset(0, _isPressed ? 4 : 7.32),
                    blurRadius: _isPressed ? 4 : 0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                'Get Started Today',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Orange CTA Action Content
class _OrangeCTAActionContent extends StatelessWidget {
  const _OrangeCTAActionContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final promptSize = isMobile ? 18.0 : (isTablet ? 22.0 : 28.0);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Prompt text
        Text(
          'READY TO FIND RELIEF ?',
          style: GoogleFonts.poppins(
            fontSize: promptSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.grey.shade900,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 24),
        // CTA Button with animation
        const _GetStartedButton(),
      ],
    );
  }
}
