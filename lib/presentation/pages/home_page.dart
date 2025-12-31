import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../application/providers/navigation_provider.dart';
import '../../application/providers/ui_state_provider.dart';
import '../../appimages/images.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/footer.dart';
import '../utils/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/');
    });

    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final screenWidth = Responsive.width(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
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
          child: Stack(
            children: [
              // Coin Image in the bottom right corner
              if (!isMobile)
                Positioned(
                  right: isTablet ? -40 : -80,
                  bottom: isTablet ? 1100 : 1400,
                  child: Opacity(
                    opacity: 0.9,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Image.asset(
                        Images.coinXmate,
                        fit: BoxFit.contain,
                        width: isTablet ? 120 : 200,
                        height: isTablet ? 120 : 200,
                      ),
                    ),
                  ),
                ),
              // X Background Image on the right side - scrolls with content
              if (!isMobile)
                Positioned(
                  right: 0,
                  top: -100,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      Images.xBackground,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                      width: isTablet ? screenWidth * 0.45 : screenWidth * 0.6,
                    ),
                  ),
                ),
              // Main content
              Column(
                children: [
                  const SizedBox(height: 20),
                  const PandoraNavbar(),
                  _HeroSection(),
                   _iPhoneSection(),
                  _CharacterSection(),
                  const SizedBox(height: 60),
                  _BannerSection(),
                  const Footer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Hero Section with Text and Phone in Hand
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    final horizontalPadding = Responsive.value(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final topPadding = Responsive.value(
      context,
      mobile: 30.0,
      tablet: 50.0,
      desktop: 80.0,
    );
    final bottomPadding = Responsive.value(
      context,
      mobile: 50.0,
      tablet: 70.0,
      desktop: 100.0,
    );
    
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
                    maxWidth: isMobile ? double.infinity : 500,
                    maxHeight: isMobile ? 400 : 500,
                  ),
                  child: Image.asset(
                    Images.phoneInHand,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text content on the left - moved down
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: _HeroTextContent(),
                  ),
                ),
                const SizedBox(width: 60),
                // Phone in hand image on the right - moved down
                Expanded(
                  flex: 1,
                  child: Transform.translate(
                    offset: const Offset(0, 20),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 700,
                        maxHeight: 800,
                      ),
                      child: Image.asset(
                        Images.phoneInHand,
                        fit: BoxFit.contain,
                      ),
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
    final isMobile = Responsive.isMobile(context);
    
    final headlineSize = Responsive.fontSize(
      context,
      mobile: 32.0,
      tablet: 40.0,
      desktop: 52.0,
    );
    final descriptionSize = Responsive.fontSize(
      context,
      mobile: 16.0,
      tablet: 18.0,
      desktop: 20.0,
    );
    
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
            height: 1.2,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Your voice deserves to be heard anytime, anywhere. Connect with compassionate listeners who are ready to support you on your journey.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: Colors.white.withOpacity(0.95),
          ),
        ),
      ],
    );
  }
}

// Character Section
class _CharacterSection extends StatelessWidget {
  const _CharacterSection();

  Widget _buildAvatarCartoonSpeechBubble(bool isTablet) {
    final bubbleWidth = isTablet ? 300.0 : 350.0;
    final bubbleHeight = isTablet ? 185.0 : 210.0;
    
    return SizedBox(
      width: bubbleWidth,
      height: bubbleHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background conversation icon
          Image.asset(
            Images.convoIcon,
            width: bubbleWidth,
            height: bubbleHeight,
            fit: BoxFit.fill,
          ),
          // Text on top
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 26.0 : 28.0,
              vertical: isTablet ? 24.0 : 26.0,
            ),
            child: Text(
              "I'm here to listen\nto your story.\nYour feelings matter\nand I'm ready to\nsupport you!",
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 14.0 : 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 5,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    final horizontalPadding = Responsive.value(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final topPadding = Responsive.value(
      context,
      mobile: 30.0,
      tablet: 50.0,
      desktop: 80.0,
    );
    final bottomPadding = Responsive.value(
      context,
      mobile: 50.0,
      tablet: 70.0,
      desktop: 100.0,
    );
    
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
          // Avatar Cartoon Image - positioned above the character section
          if (!isMobile)
            Positioned(
              right: isTablet ? 20 : 80,
              top: isTablet ? 300 : 440,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                Images.avatarCartoon,
                fit: BoxFit.contain,
                width: isTablet ? 180 : 250,
                height: isTablet ? 220 : 300,
                  ),
                  // Speech bubble for avatar cartoon
                  Positioned(
                    left: isTablet ? -300 : -350,
                    top: isTablet ? -50 : -60,
                    child: _buildAvatarCartoonSpeechBubble(isTablet),
                  ),
                ],
              ),
            ),
          // Character content
          isMobile || isTablet
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
                    const SizedBox(width: 60),
                        Expanded(
                          flex: 1,
                      child: _CharacterTextContent(),
                    ),
                  ],
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

  Widget _buildCharacterImage(String imagePath, double width, double height, {bool cropBottom = false, double? leftPadding, Alignment? imageAlignment}) {
    final containerHeight = cropBottom ? height - 8 : height; // Reduce height by 8px to remove bottom gap
    final effectiveLeftPadding = leftPadding ?? (cropBottom ? 8.0 : 8.0);
    final effectiveAlignment = imageAlignment ?? (cropBottom ? Alignment.topCenter : Alignment.center);
    
    return Container(
      width: width,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: cropBottom 
          ? EdgeInsets.only(top: 8, left: effectiveLeftPadding, right: 8, bottom: 0)
          : EdgeInsets.all(effectiveLeftPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: cropBottom
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
                alignment: effectiveAlignment,
                height: containerHeight - 8, // Account for top padding
              )
            : Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Specific sizes for each image (reduced)
    final image1Width = 295.4; // 422 * 0.7
    final image1Height = 324.1; // 463 * 0.7
    final image2Width = 217.0; // 309.79 * 0.7
    final image2Height = 238.0; // 339.89 * 0.7
    final image3Width = 135.82535705566407; // 194.04 * 0.7
    final image3Height = 149.02166442871093; // 212.89 * 0.7
    
    final overlapOffset = isMobile ? 20.0 : (isTablet ? 35.0 : 50.0);
    final stackHeight = image1Height + image2Height * 0.6;
    
    return SizedBox(
      height: stackHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Image 1 on top (larger) - animeGirl1
          _buildCharacterImage(Images.animeGirl1, image1Width, image1Height, cropBottom: true),
          // Images 2 and 3 positioned below, with image 2 overlapping
          Positioned(
            top: image1Height * 0.7,
            child: Row(
              mainAxisSize: MainAxisSize.min,
      children: [
                // Image 2 moved over to overlap image 1 - avatarGirl2
                Transform.translate(
                  offset: Offset(-overlapOffset, 50),
                  child: _buildCharacterImage(
                    Images.avatarGirl2, 
                    image2Width, 
                    image2Height, 
                    cropBottom: true,
                    leftPadding: 0.0,
                    imageAlignment: Alignment.topRight,
                  ),
                ),
                SizedBox(width: isMobile ? 0.0 : 0.0),
                // Image 3 - avatarGirl3 (moved down and closer)
                Transform.translate(
                  offset: Offset(isMobile ? -10.0 : -15.0, isMobile ? 60.0 : 70.0),
                  child: _buildCharacterImage(Images.avatarGirl3, image3Width, image3Height, cropBottom: true),
                ),
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
    final isMobile = Responsive.isMobile(context);
    
    final headlineSize = Responsive.fontSize(
      context,
      mobile: 32.0,
      tablet: 40.0,
      desktop: 52.0,
    );
    final descriptionSize = Responsive.fontSize(
      context,
      mobile: 16.0,
      tablet: 18.0,
      desktop: 20.0,
    );
    
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
            height: 1.2,
            letterSpacing: -0.5,
            color: const Color.fromRGBO(100, 147, 157, 1),
          ),
        ),
        SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
        Text(
          'Every conversation is a step toward healing.\nOur community of empathetic listeners is here to support you\non your journey to emotional wellness.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: Colors.grey.shade700,
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
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    final horizontalPadding = Responsive.value(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final topPadding = 0.0;
    final bottomPadding = Responsive.value(
      context,
      mobile: 50.0,
      tablet: 70.0,
      desktop: 100.0,
    );
    
    return Transform.translate(
      offset: Offset(0, isMobile ? -20.0 : (isTablet ? -30.0 : -40.0)),
      child: Container(
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
                    const SizedBox(height: 16),
                    _iPhoneImageCaption(),
                    const SizedBox(height: 32),
                _iPhoneTextContent(),
                  ],
                )
              : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // iPhone image moved up
                      Transform.translate(
                        offset: const Offset(0, -40),
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
                      const SizedBox(height: 16),
                      _iPhoneImageCaption(),
                    ],
                  ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 1,
                      // Text content moved down
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: _iPhoneTextContent(),
                      ),
                ),
        ],
      ),
      ),
    );
  }
}

// iPhone Text Content
class _iPhoneTextContent extends StatelessWidget {
  const _iPhoneTextContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    final headlineSize = Responsive.fontSize(
      context,
      mobile: 32.0,
      tablet: 40.0,
      desktop: 52.0,
    );
    final descriptionSize = Responsive.fontSize(
      context,
      mobile: 16.0,
      tablet: 18.0,
      desktop: 20.0,
    );
    
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
            height: 1.2,
            letterSpacing: -0.5,
            color: const Color.fromRGBO(100, 147, 157, 1),
          ),
        ),
        SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
        Text(
          'Discover a community where your feelings are validated and your experiences matter. Connect with compassionate listeners who are ready to support you.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

// iPhone Image Caption
class _iPhoneImageCaption extends StatelessWidget {
  const _iPhoneImageCaption();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    final headlineSize = Responsive.fontSize(
      context,
      mobile: 32.0,
      tablet: 40.0,
      desktop: 52.0,
    );
    final descriptionSize = Responsive.fontSize(
      context,
      mobile: 16.0,
      tablet: 18.0,
      desktop: 20.0,
    );
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'CONNECT WITH\nCOMPASSIONATE LISTENERS',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.2,
            letterSpacing: -0.5,
            color: const Color.fromRGBO(100, 147, 157, 1),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Experience meaningful connections through our app. Browse profiles, find listeners who understand, and start conversations that matter.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: descriptionSize,
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: const Color.fromRGBO(5, 12, 13, 1),
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
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    final horizontalPadding = Responsive.value(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final topPadding = Responsive.value(
      context,
      mobile: 30.0,
      tablet: 50.0,
      desktop: 80.0,
    );
    final bottomPadding = Responsive.value(
      context,
      mobile: 50.0,
      tablet: 70.0,
      desktop: 100.0,
    );
    
    return Container(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: Container(
            width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 32.0 : (isTablet ? 48.0 : 80.0),
          vertical: isMobile ? 40.0 : (isTablet ? 60.0 : 80.0),
        ),
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
          borderRadius: BorderRadius.circular(isMobile ? 24.0 : 32.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFB367).withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 0,
              ),
          ],
            ),
            child: Stack(
          clipBehavior: Clip.none,
              children: [
                // Banner image at the top right
                if (!isMobile)
                  Positioned(
                    top: isTablet ? 40 : -170,
                    child: Opacity(
                      opacity: 0.9,
                      child: Image.asset(
                        Images.bannerImg1,
                        fit: BoxFit.contain,
                        width: isTablet ? 200 : 300,
                        height: isTablet ? 200 : 300,
                      ),
                    ),
                  ),
                // Content
                isMobile || isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                        children: [
                          _BannerTextContent(),
                      const SizedBox(height: 32),
                      Text(
                        'START YOUR JOURNEY\nTO EMOTIONAL WELLNESS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 13.0 : 15.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                          letterSpacing: 0.3,
                          color: const Color.fromRGBO(100, 147, 157, 1),
                        ),
                      ),
                          const SizedBox(height: 32),
                          _BannerButtonSection(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                    flex: 3,
                            child: _BannerTextContent(),
                          ),
                  const SizedBox(width: 60),
                          Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'START YOUR JOURNEY\nTO EMOTIONAL WELLNESS',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            height: 1.4,
                            letterSpacing: 0.3,
                            color: const Color.fromRGBO(100, 147, 157, 1),
                          ),
                        ),
                        const SizedBox(height: 40),
                        _BannerButtonSection(),
                      ],
                    ),
                    ),
                  ],
            ),
              ],
            ),
      ),
    );
  }
}

// Banner Text Content
class _BannerTextContent extends StatelessWidget {
  const _BannerTextContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    final headlineSize = Responsive.fontSize(
      context,
      mobile: 32.0,
      tablet: 40.0,
      desktop: 52.0,
    );
    final descriptionSize = Responsive.fontSize(
      context,
      mobile: 16.0,
      tablet: 18.0,
      desktop: 20.0,
    );
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'READY TO FIND\nRELIEF?',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: headlineSize,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            height: 1.15,
            letterSpacing: -1.0,
            color: const Color.fromRGBO(243, 121, 0, 1),
            shadows: [
              Shadow(
                color: Colors.white.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        if (!isMobile) ...[
          SizedBox(height: Responsive.spacing(context, mobile: 16.0, desktop: 20.0)),
          Text(
            'Start your journey to emotional wellness today. Connect with compassionate listeners who are ready to support you.',
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: descriptionSize,
              fontWeight: FontWeight.w400,
              height: 1.6,
              color: const Color(0xFF0A4A5C).withOpacity(0.85),
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
    return const _GetStartedButton();
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
  static const String _buttonKey = 'get_started_button';

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
    Provider.of<UIStateProvider>(context, listen: false)
        .setButtonPressed(_buttonKey, true);
    _pressController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    Provider.of<UIStateProvider>(context, listen: false)
        .setButtonPressed(_buttonKey, false);
    _pressController.reverse();
  }

  void _handleTapCancel() {
    Provider.of<UIStateProvider>(context, listen: false)
        .setButtonPressed(_buttonKey, false);
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = Provider.of<UIStateProvider>(context, listen: true);
    final isPressed = uiState.isButtonPressed(_buttonKey);
    
    final horizontalPadding = Responsive.value(
      context,
      mobile: 20.0,
      tablet: 24.0,
      desktop: 28.0,
    );
    final verticalPadding = Responsive.value(
      context,
      mobile: 12.0,
      desktop: 14.0,
    );
    final fontSize = Responsive.fontSize(
      context,
      mobile: 12.0,
      tablet: 13.0,
      desktop: 14.0,
    );
    
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
                    color: Color.fromRGBO(201, 77, 0, isPressed ? 0.5 : 0.75),
                    offset: Offset(0, isPressed ? 4 : 7.32),
                    blurRadius: isPressed ? 4 : 0,
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