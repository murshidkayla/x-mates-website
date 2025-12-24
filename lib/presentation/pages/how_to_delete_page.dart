import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
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
      backgroundColor: AppTheme.lightBackground,
      body: Container(
        color: AppTheme.lightBackground,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PandoraNavbar(),
            // Ultra-Modern Header Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 60,
                vertical: isMobile ? 30 : 60,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    blurRadius: 12,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: const XMatezLogo(size: 50, isDark: true),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'How to Delete\nYour Account',
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.8,
                                height: 1.2,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const XMatezLogo(size: 70, isDark: true),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                'How to Delete Your Account',
                                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Follow these simple steps to permanently delete your account',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white.withValues(alpha: 0.9),
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                  ),
                ],
              ),
            ),
            // Ultra-Modern Steps Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 60,
                vertical: isMobile ? 24 : 40,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Step-by-Step Guide',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: isMobile ? 20 : 28,
                          color: AppTheme.textPrimary,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  ConstrainedBox(
              constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 1000,
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
                          color: AppTheme.primaryColor,
                          imagePath: 'assets/profileUi.png',
                  ),
                        SizedBox(height: isMobile ? 12 : 16),
                  _StepCard(
                    stepNumber: 2,
                    title: 'Go to Account Settings',
                    description:
                              'Once in your profile, look for "Settings" option in the menu list. Tap on it to access your account management options.',
                    icon: Icons.settings_outlined,
                          color: AppTheme.primaryColor,
                          imagePath: 'assets/settingui.png',
                  ),
                        SizedBox(height: isMobile ? 12 : 16),
                  _StepCard(
                    stepNumber: 3,
                    title: 'Find Delete Account Option',
                    description:
                              'In the settings menu, scroll down to find the "Delete Account" option. This is usually located towards the bottom of the settings page.',
                    icon: Icons.delete_outline,
                          color: AppTheme.primaryColor,
                          imagePath: 'assets/settingui.png',
                  ),
                        SizedBox(height: isMobile ? 12 : 16),
                  _StepCard(
                    stepNumber: 4,
                    title: 'Confirm Account Deletion',
                    description:
                              'After clicking "Delete Account", you\'ll see a confirmation dialog asking "Are you sure you want to permanently Delete your account?". Tap "Yes" to proceed with the account deletion.',
                    icon: Icons.check_circle_outline,
                          color: AppTheme.primaryColor,
                          imagePath: 'assets/deleteDailague.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Need Help Section
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: isMobile ? 16 : 60,
            //     vertical: isMobile ? 24 : 40,
            //   ),
            //   decoration: const BoxDecoration(
            //     color: AppTheme.lightBackground,
            //   ),
            //   child: Column(
            //     children: [
            //       Container(
            //         constraints: BoxConstraints(
            //           maxWidth: isMobile ? double.infinity : 800,
            //         ),
            //         padding: EdgeInsets.all(isMobile ? 16 : 20),
            //         decoration: BoxDecoration(
            //           color: AppTheme.surfaceWhite,
            //           borderRadius: BorderRadius.circular(16),
            //           border: Border.all(
            //             color: AppTheme.primaryColor.withOpacity(0.2),
            //             width: 1,
            //           ),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withValues(alpha: 0.05),
            //               blurRadius: 8,
            //               offset: const Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Container(
            //                   width: isMobile ? 40 : 48,
            //                   height: isMobile ? 40 : 48,
            //                   decoration: BoxDecoration(
            //                     color: AppTheme.primaryColor.withOpacity(0.1),
            //                     borderRadius: BorderRadius.circular(12),
            //                     border: Border.all(
            //                       color: AppTheme.primaryColor.withOpacity(0.2),
            //                       width: 1,
            //                     ),
            //                   ),
            //                   child: Icon(
            //                     Icons.warning_amber_rounded,
            //                     color: AppTheme.primaryColor,
            //                     size: isMobile ? 20 : 24,
            //                   ),
            //                 ),
            //                 SizedBox(width: isMobile ? 12 : 16),
            //                 Expanded(
            //                   child: Text(
            //                     'Important Notice',
            //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
            //                       color: AppTheme.textPrimary,
            //                       fontSize: isMobile ? 18 : 22,
            //                       fontWeight: FontWeight.w700,
            //                       letterSpacing: -0.8,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: isMobile ? 12 : 16),
            //             Text(
            //               'Account deletion is permanent and cannot be undone. All your data, including profile information, messages, and app history will be permanently removed from our servers. Please make sure you want to proceed before confirming the deletion.',
            //               style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //                 color: AppTheme.textPrimary,
            //                 fontSize: isMobile ? 13 : 15,
            //                 height: 1.5,
            //                 letterSpacing: 0.1,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Need Help Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 60,
                vertical: isMobile ? 24 : 40,
              ),
              color: AppTheme.lightBackground,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 600,
                  ),
                  padding: EdgeInsets.all(isMobile ? 24 : 32),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceWhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.primaryColor.withOpacity(0.15),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Need Help?',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      GestureDetector(
                        onTap: _launchEmail,
                        child: Text(
                          'xmatezsolutionpvtlimited390@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Footer(),
          ],
          ),
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
  final String? imagePath;

  const _StepCard({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
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
                      width: isMobile ? 48 : 56,
                      height: isMobile ? 48 : 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            color.withOpacity(0.2),
                            color.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: color.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.15),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$stepNumber',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 22,
                              fontWeight: FontWeight.w700,
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
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 10 : 12),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: isMobile ? 13 : 14,
                    height: 1.5,
                    letterSpacing: 0.1,
                  ),
                ),
                if (imagePath != null) ...[
                  SizedBox(height: isMobile ? 16 : 20),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? 220 : 300,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            color.withOpacity(0.2),
                            color.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: color.withOpacity(0.3),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.15),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$stepNumber',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                icon,
                                color: color,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  title,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppTheme.textPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (imagePath != null) ...[
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
