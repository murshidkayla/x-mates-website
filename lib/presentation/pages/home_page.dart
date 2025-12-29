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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1.0],
            colors: [
              const Color(0xFF65C7DB), // Blue shade at top
              const Color.fromRGBO(213, 233, 236, 1), // rgba(213, 233, 236, 1) at bottom
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TopBarWithLogo(),
              _HeroSection(),
               _iPhoneSection(),
              _CharacterSection(),
              _BannerSection(),
              const Footer(),
            ],
          ),
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
    final verticalPadding = isMobile ? 12.0 : 20.0;
    final logoSize = isMobile ? 80.0 : (isTablet ? 100.0 : 150.0);
    
    return Container(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: isMobile ? 8.0 : 16.0,
        bottom: verticalPadding,
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

// Hero Section with Text and Phone in Hand
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 140.0);
    final topPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text content on the left
                Expanded(
                  flex: 1,
                  child: _HeroTextContent(),
                ),
                const SizedBox(width: 48),
                // Phone in hand image on the right
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

// Hero Text Content
class _HeroTextContent extends StatelessWidget {
  const _HeroTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 32.0 : (isTablet ? 42.0 : 56.0);
    final descriptionSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'FIND PEACE THROUGH\nMEANINGFUL CONNECTIONS',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -1.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Your voice deserves to be heard anytime, anywhere. Connect with compassionate listeners who understand your journey. Share your thoughts, release your stress, and find calm through meaningful conversations.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.6,
            color: Colors.white.withOpacity(0.95),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// Character Section
class _CharacterSection extends StatelessWidget {
  const _CharacterSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 140.0);
    final topPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
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
                _CharacterImagesRow(isMobile: isMobile, isTablet: isTablet),
                const SizedBox(height: 32),
                _CharacterTextContent(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CharacterImagesRow(isMobile: false, isTablet: false),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 1,
                  child: _CharacterTextContent(),
                ),
              ],
            ),
    );
  }
}

// Character Images Row
class _CharacterImagesRow extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  
  const _CharacterImagesRow({required this.isMobile, required this.isTablet});

  Widget _buildCharacterImage(String imagePath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topImageSize = isMobile ? 120.0 : (isTablet ? 210.0 : 300.0);
    final bottomImageSize = isMobile ? 80.0 : (isTablet ? 140.0 : 200.0);
    final spacing = isMobile ? 8.0 : 16.0;
    final overlapOffset = isMobile ? 20.0 : (isTablet ? 35.0 : 50.0);
    final stackHeight = topImageSize + bottomImageSize * 0.6;
    
    return SizedBox(
      height: stackHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Image 1 on top (larger)
          _buildCharacterImage(Images.animeGirl1, topImageSize),
          // Images 2 and 3 positioned below, with image 2 overlapping
          Positioned(
            top: topImageSize * 0.7,
            child: Row(
              mainAxisSize: MainAxisSize.min,
      children: [
                // Image 2 moved over to overlap image 1
                Transform.translate(
                  offset: Offset(-overlapOffset, 0),
                  child: _buildCharacterImage(Images.avatarGirl2, bottomImageSize),
                ),
                SizedBox(width: spacing),
                _buildCharacterImage(Images.avatarGirl3, bottomImageSize),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Character Text Content
class _CharacterTextContent extends StatelessWidget {
  const _CharacterTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 28.0 : (isTablet ? 36.0 : 48.0);
    final descriptionSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'SOMEONE\'S HERE TO LISTEN',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -0.5,
            color: const Color(0xFF0A4A5C),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Every conversation is a step toward healing. Our community of empathetic listeners is here to support you on your journey to emotional wellness and inner peace. Connect with people who truly care.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.6,
            color: Colors.grey.shade700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// iPhone Section
class _iPhoneSection extends StatelessWidget {
  const _iPhoneSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 140.0);
    final topPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
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
                _iPhoneTextContent(),
                  ],
                )
              : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Expanded(
                  flex: 1,
                  child: Container(
                          constraints: const BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 600,
                    ),
                            child: Image.asset(
                      Images.iPhone16,
                                  fit: BoxFit.contain,
                                ),
                              ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 1,
                  child: _iPhoneTextContent(),
                ),
        ],
      ),
    );
  }
}

// iPhone Text Content
class _iPhoneTextContent extends StatelessWidget {
  const _iPhoneTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 28.0 : (isTablet ? 36.0 : 48.0);
    final descriptionSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'YOUR VOICE MATTERS\nYOUR STORY COUNTS',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
            letterSpacing: -0.5,
            color: const Color(0xFF0A4A5C),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Discover a community where your feelings are validated and your experiences matter. Engage in conversations that inspire growth, healing, and personal transformation.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.6,
            color: Colors.grey.shade700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// Banner Section
class _BannerSection extends StatelessWidget {
  const _BannerSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 40.0 : 140.0);
    final topPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
    final bottomPadding = isMobile ? 40.0 : 100.0;
    
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
          // Avatar Cartoon Image - positioned above the banner
          if (!isMobile)
            Positioned(
              right: isTablet ? 40 : 80,
              top: isTablet ? -100 : -120,
              child: Image.asset(
                Images.avatarCartoon,
                fit: BoxFit.contain,
                width: isTablet ? 180 : 250,
                height: isTablet ? 220 : 300,
              ),
            ),
          // Banner Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 32.0 : (isTablet ? 48.0 : 64.0)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFE5CC), // Light orange/peach
                  Color(0xFFFFD4A3), // Medium orange
                  Color(0xFFFFB367), // Darker orange
                ],
                stops: [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMobile ? 30.0 : 50.0),
                topRight: Radius.circular(isMobile ? 30.0 : 50.0),
                bottomLeft: Radius.circular(isMobile ? 30.0 : 50.0),
                bottomRight: Radius.circular(isMobile ? 30.0 : 50.0),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Content
                isMobile || isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _BannerTextContent(),
                          const SizedBox(height: 32),
                          _BannerButtonSection(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _BannerTextContent(),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: _BannerButtonSection(),
                          ),
                        ],
                      ),
            // Decorative blurred circles - positioned inside the banner
            Positioned(
              top: isMobile ? 10 : 20,
              right: isMobile ? 10 : 20,
              child: Container(
                width: isMobile ? 80 : 120,
                height: isMobile ? 80 : 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF8B17).withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8B17).withOpacity(0.5),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: isMobile ? 10 : 20,
              left: isMobile ? 10 : 20,
              child: Container(
                width: isMobile ? 60 : 100,
                height: isMobile ? 60 : 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF8B17).withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8B17).withOpacity(0.5),
                      blurRadius: 30,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: isMobile ? 30 : 50,
              right: isMobile ? 30 : 60,
              child: Container(
                width: isMobile ? 50 : 70,
                height: isMobile ? 50 : 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF8B17).withOpacity(0.25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8B17).withOpacity(0.4),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Banner Text Content
class _BannerTextContent extends StatelessWidget {
  const _BannerTextContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    final headlineSize = isMobile ? 24.0 : (isTablet ? 32.0 : 42.0);
    final descriptionSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'READY TO FIND\nRELIEF?',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w800,
            height: 1.2,
            letterSpacing: -0.5,
            color: const Color(0xFF0A4A5C),
          ),
        ),
        if (!isMobile) ...[
          const SizedBox(height: 16),
          Text(
            'Start your journey to emotional wellness today. Connect with compassionate listeners who are ready to support you.',
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: descriptionSize,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ],
    );
  }
}

// Banner Button Section
class _BannerButtonSection extends StatelessWidget {
  const _BannerButtonSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _GetStartedButton(),
      ],
    );
  }
}

// Get Started Button
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
      onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
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