import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    
    // Set route when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/terms-conditions');
    });

    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            // Header Section with Dark Background
            Container(
              width: double.infinity,
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
                  Text(
                    'Terms & Conditions',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 24 : 36,
                      letterSpacing: isMobile ? -1 : -1.5,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Text(
                    'Your rights and responsibilities when using X Matez',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: isMobile ? 16 : 20,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Text(
                    'Effective: September 6, 2025',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ],
              ),
            ),
            // Content Section with White Background
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 80,
              ),
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 900,
              ),
              color: AppTheme.surfaceWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to X Matez. These Terms & Conditions govern your use of our mobile application and related services. By accessing or using our app, you agree to be bound by these terms.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 16 : 18,
                      height: 1.6,
                      letterSpacing: 0.2,
                    ),
                  ),
                  _Section(
                    title: 'ACCEPTANCE OF TERMS',
                    children: [
                      Text(
                        'By downloading, installing, accessing, or using the X Matez mobile application, you acknowledge that you have read, understood, and agree to be bound by these Terms & Conditions and our Privacy Policy.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        'If you do not agree with any part of these terms, you must not use our application or services.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        decoration: BoxDecoration(
                          color: AppTheme.accentBlue.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.accentBlue.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppTheme.accentBlue,
                              size: isMobile ? 20 : 24,
                            ),
                            SizedBox(width: isMobile ? 12 : 16),
                            Expanded(
                              child: Text(
                                'Important Notice\n\nThese terms constitute a legally binding agreement between you and X Matez. Please read them carefully before using our services.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontSize: isMobile ? 15 : 17,
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'ABOUT X MATEZ',
                    children: [
                      Text(
                        'X Matez is a mobile application that provides communication and social interaction services. Our app is designed to facilitate meaningful conversations and connections between users.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      _SubSection(
                        title: 'Service Description',
                        content:
                            'Our services include but are not limited to:\n\n'
                            '• Real-time messaging and communication features\n'
                            '• User profile creation and management\n'
                            '• Social interaction and networking capabilities\n'
                            '• Notification and alert services',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'ELIGIBILITY AND ACCOUNT REGISTRATION',
                    children: [
                      _SubSection(
                        title: 'Age Requirements',
                        content:
                            'You must be at least 18 years of age to use X Matez. Our services are intended exclusively for adult users aged 18 and above. By using our app, you represent and warrant that you meet this age requirement.',
                      ),
                      _SubSection(
                        title: 'Age Verification',
                        content:
                            'If you are under 18 years of age, you are not permitted to access or use X Matez. We reserve the right to request proof of age and to terminate accounts that do not meet this requirement.',
                      ),
                      _SubSection(
                        title: 'Account Creation',
                        content:
                            'To access certain features of our app, you may need to create an account. When creating an account, you agree to:\n\n'
                            '• Provide accurate, current, and complete information\n'
                            '• Maintain and promptly update your account information\n'
                            '• Keep your login credentials secure and confidential\n'
                            '• Accept responsibility for all activities under your account\n'
                            '• Notify us immediately of any unauthorized account access',
                      ),
                      _SubSection(
                        title: 'Account Termination',
                        content:
                            'We reserve the right to suspend or terminate your account at any time for violations of these terms or for any other reason we deem appropriate.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'USER CONDUCT AND RESPONSIBILITIES',
                    children: [
                      _SubSection(
                        title: 'Acceptable Use',
                        content:
                            'When using X Matez, you agree to:\n\n'
                            '• Use the app only for lawful purposes\n'
                            '• Respect other users\' rights and privacy\n'
                            '• Communicate in a respectful and appropriate manner\n'
                            '• Comply with all applicable laws and regulations\n'
                            '• Report any inappropriate behavior or content',
                      ),
                      _SubSection(
                        title: 'Prohibited Activities',
                        content:
                            'You agree not to engage in any of the following prohibited activities:\n\n'
                            '• Harassment, bullying, or intimidation of other users\n'
                            '• Posting or sharing illegal, harmful, or inappropriate content\n'
                            '• Impersonating another person or entity\n'
                            '• Spamming or sending unsolicited communications\n'
                            '• Attempting to hack, disrupt, or damage our systems\n'
                            '• Violating intellectual property rights\n'
                            '• Sharing false, misleading, or defamatory information\n'
                            '• Engaging in commercial activities without authorization',
                      ),
                      _SubSection(
                        title: 'Content Responsibility',
                        content:
                            'You are solely responsible for any content you post, share, or transmit through our app. We do not endorse or take responsibility for user-generated content.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'INTELLECTUAL PROPERTY RIGHTS',
                    children: [
                      _SubSection(
                        title: 'Our Rights',
                        content:
                            'X Matez and all related content, features, and functionality are owned by us and are protected by copyright, trademark, and other intellectual property laws.',
                      ),
                      _SubSection(
                        title: 'User Content License',
                        content:
                            'By posting content on our app, you grant us a non-exclusive, royalty-free, worldwide license to use, display, reproduce, and distribute your content in connection with our services.',
                      ),
                      _SubSection(
                        title: 'Respect for Third-Party Rights',
                        content:
                            'You agree not to infringe upon the intellectual property rights of others when using our app.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PRIVACY AND DATA PROTECTION',
                    children: [
                      Text(
                        'Your privacy is important to us. Our collection, use, and protection of your personal information is governed by our Privacy Policy, which is incorporated into these terms by reference.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        'By using our app, you consent to the collection and use of your information as described in our Privacy Policy.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      _SubSection(
                        title: 'Data Security',
                        content:
                            'While we implement reasonable security measures to protect your information, you acknowledge that no method of transmission or storage is completely secure.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PAYMENTS AND SUBSCRIPTIONS',
                    children: [
                      _SubSection(
                        title: 'Paid Services',
                        content:
                            'Some features of X Matez may require payment. If you choose to purchase paid services:\n\n'
                            '• All payments are processed through secure third-party payment providers\n'
                            '• Prices are subject to change with reasonable notice\n'
                            '• Subscriptions automatically renew unless cancelled\n'
                            '• Refunds are subject to our refund policy and applicable laws',
                      ),
                      _SubSection(
                        title: 'Billing',
                        content:
                            'You authorize us to charge your chosen payment method for any applicable fees. You are responsible for maintaining valid payment information.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SERVICE AVAILABILITY AND MODIFICATIONS',
                    children: [
                      _SubSection(
                        title: 'Service Availability',
                        content:
                            'We strive to maintain continuous service availability but cannot guarantee uninterrupted access. Our app may be temporarily unavailable due to maintenance, updates, or technical issues.',
                      ),
                      _SubSection(
                        title: 'Service Modifications',
                        content:
                            'We reserve the right to modify, suspend, or discontinue any aspect of our services at any time, with or without notice.',
                      ),
                      _SubSection(
                        title: 'Updates',
                        content:
                            'We may release updates to improve functionality, security, or user experience. You agree to accept such updates as part of your use of the app.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DISCLAIMERS AND LIMITATION OF LIABILITY',
                    children: [
                      _SubSection(
                        title: 'Service Disclaimer',
                        content:
                            'X Matez is provided "as is" and "as available" without warranties of any kind, either express or implied. We do not guarantee that our services will meet your specific requirements or be error-free.',
                      ),
                      _SubSection(
                        title: 'Limitation of Liability',
                        content:
                            'To the maximum extent permitted by law, we shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of our app.',
                      ),
                      _SubSection(
                        title: 'User Interactions',
                        content:
                            'We are not responsible for the conduct of other users or the content they share. You interact with other users at your own risk.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'INDEMNIFICATION',
                    children: [
                      Text(
                        'You agree to indemnify and hold harmless X Matez from any claims, damages, losses, or expenses arising from:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Your use of the app\n'
                        '• Your violation of these terms\n'
                        '• Your infringement of any third-party rights\n'
                        '• Any content you post or share',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'TERMINATION',
                    children: [
                      _SubSection(
                        title: 'Termination by You',
                        content:
                            'You may terminate your account and stop using our services at any time by deleting the app and contacting us to close your account.',
                      ),
                      _SubSection(
                        title: 'Termination by Us',
                        content:
                            'We may terminate or suspend your access immediately, without prior notice, for any breach of these terms or for any other reason we deem appropriate.',
                      ),
                      _SubSection(
                        title: 'Effect of Termination',
                        content:
                            'Upon termination, your right to use the app will cease immediately. Provisions that by their nature should survive termination will remain in effect.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'GOVERNING LAW AND DISPUTE RESOLUTION',
                    children: [
                      _SubSection(
                        title: 'Governing Law',
                        content:
                            'These terms are governed by and construed in accordance with the laws of India, specifically the Information Technology Act, 2000 and related regulations.',
                      ),
                      _SubSection(
                        title: 'Dispute Resolution',
                        content:
                            'Any disputes arising from these terms or your use of our app will be resolved through:\n\n'
                            '• Initial good faith negotiations\n'
                            '• Mediation if negotiations fail\n'
                            '• Binding arbitration as a final resort',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CHANGES TO TERMS',
                    children: [
                      Text(
                        'We may update these Terms & Conditions periodically to reflect changes in our services or applicable laws. We will notify you of significant changes through:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• In-app notifications\n'
                        '• Email notifications (if provided)\n'
                        '• Updates posted on our website\n\n'
                        'Your continued use of the app after changes constitutes acceptance of the updated terms.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      _SubSection(
                        title: 'Review Regularly',
                        content:
                            'We encourage you to review these terms regularly to stay informed about your rights and responsibilities.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'MISCELLANEOUS',
                    children: [
                      _SubSection(
                        title: 'Entire Agreement',
                        content:
                            'These terms, together with our Privacy Policy, constitute the entire agreement between you and X Matez.',
                      ),
                      _SubSection(
                        title: 'Severability',
                        content:
                            'If any provision of these terms is found to be unenforceable, the remaining provisions will remain in full force and effect.',
                      ),
                      _SubSection(
                        title: 'Waiver',
                        content:
                            'Our failure to enforce any provision of these terms does not constitute a waiver of that provision.',
                      ),
                      _SubSection(
                        title: 'Assignment',
                        content:
                            'We may assign our rights and obligations under these terms. You may not assign your rights without our written consent.',
                      ),
                    ],
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

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 28 : 42),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.textPrimary,
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 24),
        ...children,
      ],
    );
  }
}

class _SubSection extends StatelessWidget {
  final String title;
  final String content;

  const _SubSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 20 : 24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.textPrimary,
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textPrimary,
            fontSize: isMobile ? 15 : 17,
            height: 1.6,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
