import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/logo.dart';
import '../theme/app_theme.dart';

class HowToDeletePage extends StatelessWidget {
  const HowToDeletePage({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'xmatezsolutionpvtlimited390@gmail.com',
      query: 'subject=Help with Account Deletion',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(currentRoute: '/how-to-delete'),
            // Header Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 100,
                vertical: 160,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.primaryBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.05),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const XMatezLogo(size: 120, isDark: true),
                      ),
                      const SizedBox(width: 28),
                      Expanded(
                        child: Text(
                          'How to Delete Your Account',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 44,
                            letterSpacing: -1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Follow these simple steps to permanently delete your account',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Steps Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 100,
                vertical: 120,
              ),
              color: AppTheme.surfaceWhite,
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StepCard(
                    stepNumber: 1,
                    title: 'Open Your Profile',
                    description:
                        'Navigate to your profile section in the app. This is usually found in the main menu or by tapping your profile picture/avatar.',
                    icon: Icons.person_outline,
                    color: AppTheme.accentBlue,
                  ),
                  const SizedBox(height: 40),
                  _StepCard(
                    stepNumber: 2,
                    title: 'Go to Account Settings',
                    description:
                        'Once in your profile, look for "Account Settings" or "Settings" option. Tap on it to access your account management options.',
                    icon: Icons.settings_outlined,
                    color: AppTheme.accentPurple,
                  ),
                  const SizedBox(height: 40),
                  _StepCard(
                    stepNumber: 3,
                    title: 'Find Delete Account Option',
                    description:
                        'In the account settings menu, scroll down to find the "Delete Account" option. This is usually located towards the bottom of the settings page.',
                    icon: Icons.delete_outline,
                    color: AppTheme.accentPink,
                  ),
                  const SizedBox(height: 40),
                  _StepCard(
                    stepNumber: 4,
                    title: 'Confirm Account Deletion',
                    description:
                        'After clicking "Delete Account", you\'ll see an alert dialogue asking for confirmation. Tap "Yes" to proceed with the account deletion.',
                    icon: Icons.check_circle_outline,
                    color: AppTheme.accentGreen,
                  ),
                ],
              ),
            ),
            // Important Notice Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 100,
                vertical: 120,
              ),
              color: AppTheme.lightGray,
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    padding: const EdgeInsets.all(48),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: AppTheme.accentPink.withValues(alpha: 0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 40,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: AppTheme.accentPink.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.warning_amber_rounded,
                                color: AppTheme.accentPink,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'Important Notice',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: 32,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Account deletion is permanent and cannot be undone. All your data, including profile information, messages, and app history will be permanently removed from our servers. Please make sure you want to proceed before confirming the deletion.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppTheme.textPrimary,
                            fontSize: 18,
                            height: 1.6,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Need Help Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 100,
                vertical: 120,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.accentBlue.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.accentBlue.withValues(alpha: 0.2),
                          blurRadius: 30,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.help_outline,
                      size: 40,
                      color: AppTheme.accentBlue,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Need Help?',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: 36,
                      letterSpacing: -1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      'If you\'re having trouble deleting your account or have questions about the process, please contact our support team.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppTheme.borderLight,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 30,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: AppTheme.accentBlue,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: _launchEmail,
                          child: Text(
                            'xmatezsolutionpvtlimited390@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppTheme.accentBlue,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: AppTheme.accentBlue,
                            ),
                          ),
                        ),
                      ],
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

class _StepCard extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _StepCard({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.borderLight,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.2),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$stepNumber',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 0.2,
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


