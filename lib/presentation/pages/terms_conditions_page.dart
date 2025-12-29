import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
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
      backgroundColor: AppTheme.lightBackground,
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.lightBackground,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.lightBackground,
              AppTheme.primaryColor.withOpacity(0.03),
              AppTheme.primaryColor.withOpacity(0.01),
              AppTheme.lightBackground,
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PandoraNavbar(),
            // Ultra-Modern Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: isMobile ? 50 : 100,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColorDark,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Conditions',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 48,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.5,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    'Your rights and responsibilities when using Xmatez',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: isMobile ? 16 : 18,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 16,
                      vertical: isMobile ? 6 : 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      'Effective: December 10, 2025',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Ultra-Modern Content Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: isMobile ? 40 : 60,
              ),
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 1000,
              ),
              color: AppTheme.lightBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'These Terms & Conditions govern your use of the Xmatez mobile application and its related services. By accessing or using our app, you agree to comply with and be bound by these terms.',
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
                        'By downloading, installing, accessing, or using the LoyalMeet mobile application, you acknowledge that you have read, understood, and agree to be bound by these Terms & Conditions and our Privacy Policy.',
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
                                'Important Notice\n\nThese Terms & Conditions form a legally binding agreement between you and LoyalMeet. Please read them carefully before using our services.',
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
                    title: 'ABOUT XMATEZ',
                    children: [
                      Text(
                        'Xmatez is a mobile application that enables seamless communication and social interaction. Our app is designed to help users connect and engage in meaningful conversations.',
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
                            'Our services include, but are not limited to:\n\n'
                            '• Real-time messaging and communication features\n'
                            '• User profile creation and management\n'
                            '• Social networking and interaction capabilities\n'
                            '• Content sharing, including media and files\n'
                            '• Notifications and alert services',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'ELIGIBILITY AND ACCOUNT REGISTRATION',
                    children: [
                      _SubSection(
                        title: 'Age Requirements',
                        content:
                            'You must be at least 18 years old to use Xmatez. Our services are intended solely for adult users. By accessing or using our app, you confirm that you meet this age requirement.',
                      ),
                      _SubSection(
                        title: 'Age Verification',
                        content:
                            'If you are under 18 years old, you are not allowed to access or use Xmatez. We reserve the right to request proof of age and to terminate any accounts that do not meet this requirement.',
                      ),
                      _SubSection(
                        title: 'Account Creation',
                        content:
                            'To access certain features of Xmatez, you may be required to create an account. By creating an account, you agree to:\n\n'
                            '• Provide accurate, up-to-date, and complete information\n'
                            '• Maintain and promptly update your account information as needed\n'
                            '• Keep your login credentials secure and confidential\n'
                            '• Accept responsibility for all activities performed under your account\n'
                            '• Notify us immediately of any unauthorized access to your account',
                      ),
                      _SubSection(
                        title: 'Account Termination',
                        content:
                            'We reserve the right to suspend or terminate your account at any time if you violate these terms or for any other reason we consider appropriate.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'USER CONDUCT AND RESPONSIBILITIES',
                    children: [
                      _SubSection(
                        title: 'Acceptable Use',
                        content:
                            'When using Xmatez, you agree to:\n\n'
                            '• Use the app solely for lawful purposes\n'
                            '• Respect the rights and privacy of other users\n'
                            '• Communicate in a respectful and appropriate manner\n'
                            '• Comply with all applicable laws and regulations\n'
                            '• Report any inappropriate behavior or content',
                      ),
                      _SubSection(
                        title: 'Prohibited Activities',
                        content:
                            ' You must not engage in any of the following:\n\n'
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
                            ' You are solely responsible for any content you post, share, or transmit through Xmatez. We do not endorse or assume responsibility for user-generated content.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'INTELLECTUAL PROPERTY RIGHTS',
                    children: [
                      _SubSection(
                        title: 'Our Rights',
                        content:
                            'Xmatez, including all content, features, and functionality, is owned by us and protected by copyright, trademark, and other intellectual property laws.',
                      ),
                      _SubSection(
                        title: 'User Content License',
                        content:
                            'By posting content on LoyalMeet, you grant us a non-exclusive, royalty-free, worldwide license to use, display, reproduce, and distribute your content in connection with our services.',
                      ),
                      _SubSection(
                        title: 'Respect for Third-Party Rights',
                        content:
                            'You agree not to infringe upon the intellectual property rights of others while using our app.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PRIVACY AND DATA PROTECTION',
                    children: [
                      Text(
                        'Your privacy is important to us. The collection, use, and protection of your personal information are governed by our Privacy Policy, which is incorporated into these Terms & Conditions by reference.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        'By using Xmatez, you consent to the collection and use of your information as outlined in our Privacy Policy.',
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
                            'We implement reasonable security measures to protect your information; however, you acknowledge that no method of transmission or storage is completely secure.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PAYMENTS AND SUBSCRIPTIONS',
                    children: [
                      _SubSection(
                        title: 'Paid Services',
                        content:
                            'Some features of Xmatez may require payment. By purchasing paid services, you agree to the following:\n\n'
                            '• All payments are processed securely through third-party payment providers\n'
                            '• Prices may change with reasonable notice\n'
                            '• Subscriptions automatically renew unless cancelled\n'
                            '• Refunds are governed by our refund policy and applicable laws',
                      ),
                      _SubSection(
                        title: 'Billing',
                        content:
                            'You authorize us to charge your selected payment method for any applicable fees. It is your responsibility to maintain valid and up-to-date payment information.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SERVICE AVAILABILITY AND MODIFICATIONS',
                    children: [
                      _SubSection(
                        title: 'Service Availability',
                        content:
                            'We strive to keep Xmatez available at all times; however, we cannot guarantee uninterrupted access. The app may be temporarily unavailable due to maintenance, updates, or technical issues.',
                      ),
                      _SubSection(
                        title: 'Service Modifications',
                        content:
                            'We reserve the right to modify, suspend, or discontinue any part of our services at any time, with or without notice.',
                      ),
                      _SubSection(
                        title: 'Updates',
                        content:
                            'We may release updates to enhance functionality, security, or user experience. By using the app, you agree to accept these updates as part of your continued use of Xmatez.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DISCLAIMERS AND LIMITATION OF LIABILITY',
                    children: [
                      _SubSection(
                        title: 'Service Disclaimer',
                        content:
                            'Xmatez is provided on an "as is" and "as available" basis, without warranties of any kind, either express or implied. We do not guarantee that our services will meet your specific needs or be error-free.',
                      ),
                      _SubSection(
                        title: 'Limitation of Liability',
                        content:
                            'To the fullest extent permitted by law, we shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of Xmatez.',
                      ),
                      _SubSection(
                        title: 'User Interactions',
                        content:
                            'We are not responsible for the behavior of other users or the content they share. Any interactions with other users are at your own risk.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'INDEMNIFICATION',
                    children: [
                      Text(
                        'You agree to indemnify and hold harmless Xmatez from any claims, damages, losses, or expenses resulting from:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Your use of the app\n'
                        '• Your violation of these Terms & Conditions\n'
                        '• Your infringement of any third-party rights\n'
                        '• Any content you post or share on the app',
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
                            'We may suspend or terminate your access immediately, without prior notice, for any breach of these Terms or for any other reason we consider appropriate.',
                      ),
                      _SubSection(
                        title: 'Effect of Termination',
                        content:
                            'Upon termination, your right to use LoyalMeet will end immediately. Any provisions that by their nature should survive termination will continue to remain in effect.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'GOVERNING LAW AND DISPUTE RESOLUTION',
                    children: [
                      _SubSection(
                        title: 'Governing Law',
                        content:
                            'These Terms & Conditions are governed by and interpreted in accordance with the laws of India, including the Information Technology Act, 2000 and related regulations.',
                      ),
                      _SubSection(
                        title: 'Dispute Resolution',
                        content:
                            'Any disputes arising from these Terms or your use of Xmatez will be resolved through the following steps:\n\n'
                            '• Initial good faith negotiations\n'
                            '• Mediation if negotiations are unsuccessful\n'
                            '• Binding arbitration as a final recourse',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CHANGES TO TERMS',
                    children: [
                      Text(
                        'We may update these Terms & Conditions from time to time to reflect changes in our services or applicable laws. Significant updates will be communicated through:',
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
                        'Your continued use of LoyalMeet after any changes constitutes acceptance of the updated terms.',
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
                            'We encourage you to review these Terms periodically to stay informed about your rights and responsibilities.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'MISCELLANEOUS',
                    children: [
                      _SubSection(
                        title: 'Entire Agreement',
                        content:
                            'These Terms, together with our Privacy Policy, constitute the entire agreement between you and Xmatez.',
                      ),
                      _SubSection(
                        title: 'Severability',
                        content:
                            'If any provision of these Terms is found to be unenforceable, the remaining provisions will continue in full force and effect.',
                      ),
                      _SubSection(
                        title: 'Waiver',
                        content:
                            'Our failure to enforce any provision of these Terms does not constitute a waiver of that provision.',
                      ),
                      _SubSection(
                        title: 'Assignment',
                        content:
                            'We may assign our rights and obligations under these Terms. You may not assign your rights without our prior written consent.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CONTACT INFORMATION',
                    children: [
                      Text(
                        'For any questions or requests related to your privacy, please reach out to us:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '📧 xmatezsolutionpvtlimited390@gmail.com\n'
                        '📞 +91 9495270656',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
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
