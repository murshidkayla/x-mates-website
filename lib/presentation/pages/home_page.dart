import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/ui_state_provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/logo.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UIStateProvider(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    
    // Set route when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/');
    });
    
    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            // Full-Width Hero Section
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: isMobile 
                    ? MediaQuery.of(context).size.height * 0.5
                    : MediaQuery.of(context).size.height * 0.6,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlack,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryBlack,
                    AppTheme.primaryBlack,
                    AppTheme.darkGray.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Animated Background Glow Effects
                  Positioned.fill(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            Positioned(
                              top: -100,
                              right: -100,
                              child: Container(
                                width: (isMobile ? 200 : 400) * value,
                                height: (isMobile ? 200 : 400) * value,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      AppTheme.accentBlue.withValues(alpha: 0.15 * value),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -150,
                              left: -150,
                              child: Container(
                                width: (isMobile ? 250 : 500) * value,
                                height: (isMobile ? 250 : 500) * value,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      AppTheme.accentPurple.withValues(alpha: 0.12 * value),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  // Main Content
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 100,
                        vertical: isMobile ? 30 : 50,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Animated Logo with Simple Hover Effect
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.easeOut,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Consumer<UIStateProvider>(
                                  builder: (context, provider, child) {
                                    final isHovered = provider.isHovered('hero_logo');
                                    return MouseRegion(
                                      onEnter: (_) => provider.setHovered('hero_logo', true),
                                      onExit: (_) => provider.setHovered('hero_logo', false),
                                      child: TweenAnimationBuilder<double>(
                                        tween: Tween(begin: 1.0, end: isHovered ? 1.15 : 1.0),
                                        duration: const Duration(milliseconds: 800),
                                        curve: Curves.easeInOut,
                                        builder: (context, scaleValue, child) {
                                          return Transform.scale(
                                            scale: (0.7 + (value * 0.3)) * scaleValue,
                                            alignment: Alignment.center,
                                            child: XMatezLogo(
                                              size: isMobile ? 140 : 240,
                                              isDark: true,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 24 : 40),
                          // Enhanced Title with Fade Animation
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 1200),
                            curve: Curves.easeOut,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, 30 * (1 - value)),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white,
                                        Colors.white.withValues(alpha: 0.95),
                                        Colors.white.withValues(alpha: 0.9),
                                      ],
                                    ).createShader(bounds),
                                    child: Text(
                                      'Connect, Chat & Share Moments',
                                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                        color: Colors.white,
                                        height: 1.1,
                                        letterSpacing: isMobile ? -1.5 : -2.5,
                                        fontSize: isMobile ? 24 : 44,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 24 : 40),
                          // Enhanced Subtitle
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 1400),
                            curve: Curves.easeOut,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, 20 * (1 - value)),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: isMobile ? double.infinity : 800,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isMobile ? 8 : 0,
                                      ),
                                      child: Text(
                                        'Looking for a space to talk and express yourself? We provide a platform where you can share your feelings, seek emotional support, and connect with others who understand. Your privacy and trust matter to us, and we\'re committed to creating a supportive community.',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.white.withValues(alpha: 0.92),
                                          fontSize: isMobile ? 15 : 20,
                                          height: 1.6,
                                          letterSpacing: 0.2,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 28 : 48),
                          // Enhanced CTA Buttons
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 1600),
                            curve: Curves.easeOut,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, 20 * (1 - value)),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: isMobile ? 16 : 24,
                                    runSpacing: isMobile ? 16 : 24,
                                    children: [
                                      _PremiumButton(
                                        hoverKey: 'button_legal_docs',
                                        label: isMobile ? 'Legal Docs' : '📋 View Legal Docs',
                                        icon: Icons.description_outlined,
                                        color: AppTheme.accentBlue,
                                        onTap: () => Navigator.of(context).pushReplacementNamed('/privacy-policy'),
                                      ),
                                      _PremiumButton(
                                        hoverKey: 'button_contact_support',
                                        label: isMobile ? 'Contact' : '💬 Contact Support',
                                        icon: Icons.chat_bubble_outline,
                                        color: AppTheme.surfaceWhite,
                                        isOutlined: true,
                                        onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Enhanced Features Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 60 : 120,
              ),
              color: AppTheme.lightGray,
              child: Column(
                children: [
                  Text(
                    'Transparency & Trust',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      letterSpacing: -1.5,
                      fontSize: isMobile ? 28 : 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 680,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 0,
                      ),
                      child: Text(
                        'We believe in complete transparency about how we handle your data and what terms govern our service. All our legal documents are designed to protect your rights while enabling us to provide you with the best possible experience.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: isMobile ? 15 : 18,
                          height: 1.6,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 28 : 56),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      if (isMobileLayout) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                          children: [
                            _PremiumFeatureCard(
                              hoverKey: 'feature_safe_community',
                              icon: Icons.shield_outlined,
                              title: 'Safe',
                              subtitle: 'Community',
                              description: 'Your safety is our priority',
                              color: AppTheme.accentGreen,
                            ),
                            _PremiumFeatureCard(
                              hoverKey: 'feature_private_conversations',
                              icon: Icons.lock_outline,
                              title: 'Private',
                              subtitle: 'Conversations',
                              description: 'End-to-end privacy protection',
                              color: AppTheme.accentPurple,
                            ),
                            _PremiumFeatureCard(
                              hoverKey: 'feature_24_7_available',
                              icon: Icons.access_time,
                              title: '24/7',
                              subtitle: 'Available',
                              description: 'Round-the-clock support',
                              color: AppTheme.accentBlue,
                            ),
                            _PremiumFeatureCard(
                              hoverKey: 'feature_supportive_environment',
                              icon: Icons.favorite_outline,
                              title: 'Supportive',
                              subtitle: 'Environment',
                              description: 'Caring community space',
                              color: AppTheme.accentPink,
                            ),
                          ],
                        );
                      } else {
                        return IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: _PremiumFeatureCard(
                                    hoverKey: 'feature_safe_community',
                                    icon: Icons.shield_outlined,
                                    title: 'Safe',
                                    subtitle: 'Community',
                                    description: 'Your safety is our priority',
                                    color: AppTheme.accentGreen,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: _PremiumFeatureCard(
                                    hoverKey: 'feature_private_conversations',
                                    icon: Icons.lock_outline,
                                    title: 'Private',
                                    subtitle: 'Conversations',
                                    description: 'End-to-end privacy protection',
                                    color: AppTheme.accentPurple,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: _PremiumFeatureCard(
                                    hoverKey: 'feature_24_7_available',
                                    icon: Icons.access_time,
                                    title: '24/7',
                                    subtitle: 'Available',
                                    description: 'Round-the-clock support',
                                    color: AppTheme.accentBlue,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: _PremiumFeatureCard(
                                    hoverKey: 'feature_supportive_environment',
                                    icon: Icons.favorite_outline,
                                    title: 'Supportive',
                                    subtitle: 'Environment',
                                    description: 'Caring community space',
                                    color: AppTheme.accentPink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Enhanced Legal Documents Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 60 : 120,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                children: [
                  Text(
                    'Legal Documents',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      letterSpacing: -1.5,
                      fontSize: isMobile ? 28 : 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 28 : 56),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      if (isMobileLayout) {
                        return Column(
                          children: [
                            _PremiumLegalCard(
                              hoverKey: 'legal_privacy_policy',
                              icon: Icons.privacy_tip_outlined,
                              title: 'Privacy Policy',
                              description: 'Learn how we collect, use, and protect your personal information in our supportive community. Your conversations and emotional well-being are our top priority.',
                              buttonText: 'Read Privacy Policy',
                              color: AppTheme.accentBlue,
                              onTap: () => Navigator.of(context).pushReplacementNamed('/privacy-policy'),
                            ),
                            const SizedBox(height: 32),
                            _PremiumLegalCard(
                              hoverKey: 'legal_terms_conditions',
                              icon: Icons.gavel_outlined,
                              title: 'Terms & Conditions',
                              description: 'Understand the terms that govern your use of X Matez. These terms ensure a safe, supportive environment for emotional expression and community connection.',
                              buttonText: 'View Terms',
                              color: AppTheme.accentPurple,
                              onTap: () => Navigator.of(context).pushReplacementNamed('/terms-conditions'),
                            ),
                          ],
                        );
                      } else {
                        return IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: _PremiumLegalCard(
                                    hoverKey: 'legal_privacy_policy',
                                    icon: Icons.privacy_tip_outlined,
                                    title: 'Privacy Policy',
                                    description: 'Learn how we collect, use, and protect your personal information in our supportive community. Your conversations and emotional well-being are our top priority.',
                                    buttonText: 'Read Privacy Policy',
                                    color: AppTheme.accentBlue,
                                    onTap: () => Navigator.of(context).pushReplacementNamed('/privacy-policy'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: _PremiumLegalCard(
                                    hoverKey: 'legal_terms_conditions',
                                    icon: Icons.gavel_outlined,
                                    title: 'Terms & Conditions',
                                    description: 'Understand the terms that govern your use of X Matez. These terms ensure a safe, supportive environment for emotional expression and community connection.',
                                    buttonText: 'View Terms',
                                    color: AppTheme.accentPurple,
                                    onTap: () => Navigator.of(context).pushReplacementNamed('/terms-conditions'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Enhanced Need Help or Support Section - Full Width
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 80,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlack,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryBlack,
                    const Color(0xFF1a0d2e),
                    AppTheme.primaryBlack,
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Consumer<UIStateProvider>(
                  //   builder: (context, provider, child) {
                  //     final isHovered = provider.isHovered('support_logo');
                  //     return MouseRegion(
                  //       onEnter: (_) => provider.setHovered('support_logo', true),
                  //       onExit: (_) => provider.setHovered('support_logo', false),
                  //       child: TweenAnimationBuilder<double>(
                  //         tween: Tween(begin: 1.0, end: isHovered ? 1.15 : 1.0),
                  //         duration: const Duration(milliseconds: 800),
                  //         curve: Curves.easeInOut,
                  //         builder: (context, scaleValue, child) {
                  //           return Transform.scale(
                  //             scale: scaleValue,
                  //             alignment: Alignment.center,
                  //             child: XMatezLogo(
                  //               size: isMobile ? 100 : 160,
                  //               isDark: true,
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  SizedBox(height: isMobile ? 24 : 36),
                  Text(
                    'Need Help or Support?',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      letterSpacing: -1.5,
                      fontSize: isMobile ? 24 : 36,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 800,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 0,
                      ),
                      child: Text(
                        'If you have any questions about our platform, need assistance, or want to report any concerns about our community, don\'t hesitate to reach out to us.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: isMobile ? 15 : 20,
                          height: 1.6,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 28 : 48),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      return                       Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: isMobileLayout ? double.infinity : 1200,
                        ),
                        child: isMobileLayout
                            ? Column(
                                children: [
                                  _ContactInfoCard(
                                    hoverKey: 'contact_email',
                                    icon: Icons.email_outlined,
                                    label: 'Email',
                                    value: 'xmatezsolutionpvtlimited390@gmail.com',
                                    onTap: () async {
                                      final Uri emailUri = Uri(
                                        scheme: 'mailto',
                                        path: 'xmatezsolutionpvtlimited390@gmail.com',
                                        query: 'subject=Contact from X Matez Website',
                                      );
                                      if (await canLaunchUrl(emailUri)) {
                                        await launchUrl(emailUri);
                                      }
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  _ContactInfoCard(
                                    hoverKey: 'contact_phone',
                                    icon: Icons.phone_outlined,
                                    label: 'Phone',
                                    value: '+91 9495270656',
                                    onTap: () async {
                                      final Uri phoneUri = Uri(scheme: 'tel', path: '+919495270656');
                                      if (await canLaunchUrl(phoneUri)) {
                                        await launchUrl(phoneUri);
                                      }
                                    },
                                  ),
                                ],
                              )
                            : IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: _ContactInfoCard(
                                          hoverKey: 'contact_email',
                                          icon: Icons.email_outlined,
                                          label: 'Email',
                                          value: 'xmatezsolutionpvtlimited390@gmail.com',
                                          onTap: () async {
                                            final Uri emailUri = Uri(
                                              scheme: 'mailto',
                                              path: 'xmatezsolutionpvtlimited390@gmail.com',
                                              query: 'subject=Contact from X Matez Website',
                                            );
                                            if (await canLaunchUrl(emailUri)) {
                                              await launchUrl(emailUri);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: _ContactInfoCard(
                                          hoverKey: 'contact_phone',
                                          icon: Icons.phone_outlined,
                                          label: 'Phone',
                                          value: '+91 9495270656',
                                          onTap: () async {
                                            final Uri phoneUri = Uri(scheme: 'tel', path: '+919495270656');
                                            if (await canLaunchUrl(phoneUri)) {
                                              await launchUrl(phoneUri);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    },
                  ),
                  SizedBox(height: isMobile ? 24 : 40),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 8 : 0,
                    ),
                    child: Text(
                      'Or use our email form for a quick response.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white.withValues(alpha: 0.8),
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _PremiumButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isOutlined;
  final VoidCallback onTap;
  final String hoverKey;

  const _PremiumButton({
    required this.label,
    required this.icon,
    required this.color,
    this.isOutlined = false,
    required this.onTap,
    required this.hoverKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UIStateProvider>(
      builder: (context, provider, child) {
        final isHovered = provider.isHovered(hoverKey);
        
        return MouseRegion(
          onEnter: (_) => provider.setHovered(hoverKey, true),
          onExit: (_) => provider.setHovered(hoverKey, false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..scale(isHovered ? 0.96 : 1.0),
            decoration: BoxDecoration(
              color: isOutlined ? Colors.transparent : color,
              borderRadius: BorderRadius.circular(22),
              border: isOutlined
                  ? Border.all(
                      color: Colors.white.withValues(alpha: isHovered ? 0.75 : 0.5),
                      width: 2.5,
                    )
                  : null,
              boxShadow: isOutlined
                  ? null
                  : [
                      BoxShadow(
                        color: color.withValues(alpha: isHovered ? 0.5 : 0.35),
                        blurRadius: isHovered ? 40 : 25,
                        offset: Offset(0, isHovered ? 18 : 10),
                      ),
                    ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width <= 768 ? 24 : 36,
                    vertical: MediaQuery.of(context).size.width <= 768 ? 16 : 18,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: MediaQuery.of(context).size.width <= 768 ? 20 : 22,
                        color: Colors.white,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width <= 768 ? 8 : 12),
                      Flexible(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width <= 768 ? 15 : 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.4,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PremiumFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final String hoverKey;

  const _PremiumFeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.hoverKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UIStateProvider>(
      builder: (context, provider, child) {
        final isHovered = provider.isHovered(hoverKey);
        
        return MouseRegion(
          onEnter: (_) => provider.setHovered(hoverKey, true),
          onExit: (_) => provider.setHovered(hoverKey, false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transform: Matrix4.identity()..scale(isHovered ? 1.03 : 1.0),
            decoration: BoxDecoration(
              color: AppTheme.surfaceWhite,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isHovered ? 0.1 : 0.06),
                  blurRadius: isHovered ? 80 : 50,
                  offset: Offset(0, isHovered ? 27 : 15),
                ),
              ],
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 768 ? 20 : 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: MediaQuery.of(context).size.width <= 768
                      ? (isHovered ? 60 : 56)
                      : (isHovered ? 100 : 96),
                  height: MediaQuery.of(context).size.width <= 768
                      ? (isHovered ? 60 : 56)
                      : (isHovered ? 100 : 96),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: isHovered ? 0.18 : 0.14),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: isHovered ? 0.3 : 0.22),
                        blurRadius: isHovered ? 45 : 30,
                        spreadRadius: isHovered ? 4 : 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    size: MediaQuery.of(context).size.width <= 768
                        ? (isHovered ? 30 : 28)
                        : (isHovered ? 50 : 48),
                    color: color,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 12 : 28),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: MediaQuery.of(context).size.width <= 768 ? 18 : 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 4 : 12),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: MediaQuery.of(context).size.width <= 768 ? 13 : 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 6 : 14),
                Flexible(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary.withValues(alpha: 0.8),
                      fontSize: MediaQuery.of(context).size.width <= 768 ? 12 : 16,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PremiumLegalCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final Color color;
  final VoidCallback onTap;
  final String hoverKey;

  const _PremiumLegalCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.color,
    required this.onTap,
    required this.hoverKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UIStateProvider>(
      builder: (context, provider, child) {
        final isHovered = provider.isHovered(hoverKey);
        
        return MouseRegion(
          onEnter: (_) => provider.setHovered(hoverKey, true),
          onExit: (_) => provider.setHovered(hoverKey, false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
            decoration: BoxDecoration(
              color: AppTheme.surfaceWhite,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppTheme.borderLight.withValues(alpha: isHovered ? 0.5 : 1.0),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.08 : 0.05),
                blurRadius: isHovered ? 60 : 40,
                offset: Offset(0, isHovered ? 20 : 12),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(28),
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 768 ? 32 : 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: MediaQuery.of(context).size.width <= 768
                          ? (isHovered ? 56 : 52)
                          : (isHovered ? 72 : 64),
                      height: MediaQuery.of(context).size.width <= 768
                          ? (isHovered ? 56 : 52)
                          : (isHovered ? 72 : 64),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: isHovered ? 0.16 : 0.14),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: isHovered ? 0.28 : 0.22),
                            blurRadius: isHovered ? 30 : 25,
                            spreadRadius: isHovered ? 3 : 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        size: MediaQuery.of(context).size.width <= 768
                            ? (isHovered ? 28 : 26)
                            : (isHovered ? 36 : 32),
                        color: color,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 20 : 28),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.textPrimary,
                        letterSpacing: -1.2,
                        fontSize: MediaQuery.of(context).size.width <= 768 ? 26 : 36,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 16 : 20),
                    Flexible(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: MediaQuery.of(context).size.width <= 768 ? 15 : 18,
                          height: 1.6,
                          letterSpacing: 0.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 20 : 28),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width <= 768 ? 16 : 18,
                              fontWeight: FontWeight.w600,
                              color: color,
                              letterSpacing: 0.4,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width <= 768 ? 8 : 12),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: MediaQuery.of(context).size.width <= 768 ? 18 : 20,
                          color: color,
                        ),
                      ],
                    ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final String hoverKey;

  const _ContactInfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    required this.hoverKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UIStateProvider>(
      builder: (context, provider, child) {
        final isHovered = provider.isHovered(hoverKey);
        
        return MouseRegion(
          onEnter: (_) => provider.setHovered(hoverKey, true),
          onExit: (_) => provider.setHovered(hoverKey, false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width <= 768 ? 20 : 32,
              vertical: MediaQuery.of(context).size.width <= 768 ? 20 : 28,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isHovered ? 0.15 : 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: isHovered ? 0.3 : 0.2),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: MediaQuery.of(context).size.width <= 768 ? 20 : 24,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width <= 768 ? 12 : 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width <= 768 ? 12 : 14,
                              color: Colors.white.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width <= 768 ? 3 : 4),
                          Text(
                            value,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width <= 768 ? 13 : 16,
                              color: Colors.white.withValues(alpha: 0.95),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.1,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
