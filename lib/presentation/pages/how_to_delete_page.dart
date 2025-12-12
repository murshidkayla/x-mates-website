import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/navigation_provider.dart';
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
    
    // Set route when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/how-to-delete');
    });

    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            // Header Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 100,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.primaryBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
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
                              child: const XMatezLogo(size: 80, isDark: true),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'How to Delete Your Account',
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        )
                      : Row(
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
                                  fontSize: 36,
                                  letterSpacing: -1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Text(
                    'Follow these simple steps to permanently delete your account',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: isMobile ? 16 : 20,
                    ),
                  ),
                ],
              ),
            ),
            // Steps Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 80,
              ),
              color: AppTheme.surfaceWhite,
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 900,
              ),
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
                  SizedBox(height: isMobile ? 20 : 32),
                  _StepCard(
                    stepNumber: 2,
                    title: 'Go to Account Settings',
                    description:
                        'Once in your profile, look for "Account Settings" or "Settings" option. Tap on it to access your account management options.',
                    icon: Icons.settings_outlined,
                    color: AppTheme.accentPurple,
                  ),
                  SizedBox(height: isMobile ? 20 : 32),
                  _StepCard(
                    stepNumber: 3,
                    title: 'Find Delete Account Option',
                    description:
                        'In the account settings menu, scroll down to find the "Delete Account" option. This is usually located towards the bottom of the settings page.',
                    icon: Icons.delete_outline,
                    color: AppTheme.accentPink,
                  ),
                  SizedBox(height: isMobile ? 20 : 32),
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
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 80,
              ),
              color: AppTheme.lightGray,
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 900,
                    ),
                    padding: EdgeInsets.all(isMobile ? 20 : 36),
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
                              width: isMobile ? 48 : 56,
                              height: isMobile ? 48 : 56,
                              decoration: BoxDecoration(
                                color: AppTheme.accentPink.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.warning_amber_rounded,
                                color: AppTheme.accentPink,
                                size: isMobile ? 28 : 32,
                              ),
                            ),
                            SizedBox(width: isMobile ? 16 : 20),
                            Flexible(
                              child: Text(
                                'Important Notice',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontSize: isMobile ? 22 : 28,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 16 : 24),
                        Text(
                          'Account deletion is permanent and cannot be undone. All your data, including profile information, messages, and app history will be permanently removed from our servers. Please make sure you want to proceed before confirming the deletion.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppTheme.textPrimary,
                            fontSize: isMobile ? 16 : 18,
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
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 80,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                children: [
                  Container(
                    width: isMobile ? 64 : 80,
                    height: isMobile ? 64 : 80,
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
                    child: Icon(
                      Icons.help_outline,
                      size: isMobile ? 32 : 40,
                      color: AppTheme.accentBlue,
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 32),
                  Text(
                    'Need Help?',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 24 : 32,
                      letterSpacing: -1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 640,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 0,
                      ),
                      child: Text(
                        'If you\'re having trouble deleting your account or have questions about the process, please contact our support team.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: isMobile ? 16 : 18,
                          height: 1.6,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 24 : 36),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 500,
                    ),
                    padding: EdgeInsets.all(isMobile ? 20 : 32),
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
                              size: isMobile ? 20 : 24,
                            ),
                            SizedBox(width: isMobile ? 10 : 12),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: isMobile ? 18 : 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 12 : 16),
                        GestureDetector(
                          onTap: _launchEmail,
                          child: Text(
                            'xmatezsolutionpvtlimited390@gmail.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 15 : 18,
                              color: AppTheme.accentBlue,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: AppTheme.accentBlue,
                            ),
                            overflow: TextOverflow.ellipsis,
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
    final isMobile = MediaQuery.of(context).size.width <= 768;
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 40),
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
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
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
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: color,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: 15,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            )
          : Row(
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


