import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/ui_state_provider.dart';
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
    
    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(currentRoute: '/'),
            // Full-Width Hero Section
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.85,
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
                                width: 400 * value,
                                height: 400 * value,
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
                                width: 500 * value,
                                height: 500 * value,
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
                        horizontal: isMobile ? 24 : 120,
                        vertical: 80,
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
                                            child: const XMatezLogo(
                                              size: 240,
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
                          const SizedBox(height: 64),
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
                                        height: 1.05,
                                        letterSpacing: -2.5,
                                        fontSize: isMobile ? 40 : 56,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
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
                                    constraints: const BoxConstraints(maxWidth: 800),
                                    child: Text(
                                      'Looking for a space to talk and express yourself? We provide a platform where you can share your feelings, seek emotional support, and connect with others who understand. Your privacy and trust matter to us, and we\'re committed to creating a supportive community.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.white.withValues(alpha: 0.92),
                                        fontSize: isMobile ? 17 : 20,
                                        height: 1.7,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 64),
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
                                    spacing: 24,
                                    runSpacing: 24,
                                    children: [
                                      _PremiumButton(
                                        hoverKey: 'button_legal_docs',
                                        label: '📋 View Legal Docs',
                                        icon: Icons.description_outlined,
                                        color: AppTheme.accentBlue,
                                        onTap: () => Navigator.of(context).pushReplacementNamed('/privacy-policy'),
                                      ),
                                      _PremiumButton(
                                        hoverKey: 'button_contact_support',
                                        label: '💬 Contact Support',
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
                horizontal: isMobile ? 24 : 100,
                vertical: 120,
              ),
              color: AppTheme.lightGray,
              child: Column(
                children: [
                  Text(
                    'Transparency & Trust',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      letterSpacing: -1.5,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 680),
                    child: Text(
                      'We believe in complete transparency about how we handle your data and what terms govern our service. All our legal documents are designed to protect your rights while enabling us to provide you with the best possible experience.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 24,
                        runSpacing: 24,
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
                        ].map((card) => SizedBox(
                          width: isMobileLayout ? double.infinity : 280,
                          child: card,
                        )).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Enhanced Legal Documents Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 100,
                vertical: 120,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                children: [
                  Text(
                    'Legal Documents',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      letterSpacing: -1.5,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 32,
                        runSpacing: 32,
                        children: [
                          SizedBox(
                            width: isMobileLayout ? double.infinity : 500,
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
                          SizedBox(
                            width: isMobileLayout ? double.infinity : 580,
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
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            // Enhanced Contact & Support Section - Full Width
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 120,
                vertical: 120,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.lightGray,
                    AppTheme.accentBlue.withValues(alpha: 0.03),
                    AppTheme.lightGray,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppTheme.accentBlue.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.accentBlue.withValues(alpha: 0.2),
                          blurRadius: 30,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.support_agent_rounded,
                      size: 36,
                      color: AppTheme.accentBlue,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Contact & Support',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.textPrimary,
                      letterSpacing: -1,
                      fontSize: isMobile ? 32 : 40,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'Have questions about our platform or need support? Get in touch with our team. We\'re here to help and ensure you have the best experience in our supportive community.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: isMobile ? 17 : 20,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  _PremiumButton(
                    hoverKey: 'button_contact_us_main',
                    label: 'Contact Us',
                    icon: Icons.email_outlined,
                    color: AppTheme.accentBlue,
                    onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
                  ),
                ],
              ),
            ),
            // Enhanced Need Help or Support Section - Full Width
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 120,
                vertical: 120,
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
                  Consumer<UIStateProvider>(
                    builder: (context, provider, child) {
                      final isHovered = provider.isHovered('support_logo');
                      return MouseRegion(
                        onEnter: (_) => provider.setHovered('support_logo', true),
                        onExit: (_) => provider.setHovered('support_logo', false),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 1.0, end: isHovered ? 1.15 : 1.0),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                          builder: (context, scaleValue, child) {
                            return Transform.scale(
                              scale: scaleValue,
                              alignment: Alignment.center,
                              child: const XMatezLogo(size: 160, isDark: true),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Need Help or Support?',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      letterSpacing: -1.5,
                      fontSize: isMobile ? 36 : 44,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'If you have any questions about our platform, need assistance, or want to report any concerns about our community, don\'t hesitate to reach out to us.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isMobile ? 17 : 20,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobileLayout = constraints.maxWidth < 768;
                      return Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 32,
                          runSpacing: 32,
                          children: [
                            _ContactInfoCard(
                              hoverKey: 'contact_email',
                              icon: Icons.email_outlined,
                              label: 'Email',
                              value: 'xmatezsolutionpvtlimited390@gmail.com',
                              color: AppTheme.accentBlue,
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
                            _ContactInfoCard(
                              hoverKey: 'contact_phone',
                              icon: Icons.phone_outlined,
                              label: 'Phone',
                              value: '+91 9495270656',
                              color: AppTheme.accentPurple,
                              onTap: () async {
                                final Uri phoneUri = Uri(scheme: 'tel', path: '+919495270656');
                                if (await canLaunchUrl(phoneUri)) {
                                  await launchUrl(phoneUri);
                                }
                              },
                            ),
                          ].map((card) => SizedBox(
                            width: isMobileLayout ? double.infinity : 400,
                            child: card,
                          )).toList(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 56),
                  Text(
                    'Or use our email form for a quick response.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.8),
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.2,
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
    super.key,
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
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 22, color: Colors.white),
                      const SizedBox(width: 12),
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.4,
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
    super.key,
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
            padding: const EdgeInsets.all(48),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: isHovered ? 100 : 96,
                  height: isHovered ? 100 : 96,
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
                    size: isHovered ? 50 : 48,
                    color: color,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary.withValues(alpha: 0.8),
                    fontSize: 16,
                    height: 1.5,
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
    super.key,
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
                padding: const EdgeInsets.all(48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isHovered ? 72 : 64,
                      height: isHovered ? 72 : 64,
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
                        size: isHovered ? 36 : 32,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.textPrimary,
                        letterSpacing: -1.2,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                        height: 1.6,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: color,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
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
  final Color color;
  final VoidCallback onTap;
  final String hoverKey;

  const _ContactInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
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
            transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
            decoration: BoxDecoration(
              color: color,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: isHovered ? 0.45 : 0.35),
                blurRadius: isHovered ? 35 : 25,
                offset: Offset(0, isHovered ? 15 : 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(
                      icon,
                      size: isHovered ? 40 : 36,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
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
