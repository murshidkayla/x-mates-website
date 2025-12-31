import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    // Set route when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/privacy-policy');
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.lightBackground,
              AppTheme.primaryColor.withOpacity(0.05),
              AppTheme.primaryColor.withOpacity(0.02),
              AppTheme.lightBackground,
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const PandoraNavbar(),
            // Ultra-Modern Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.value(context, mobile: 20.0, tablet: 40.0, desktop: 80.0),
                vertical: Responsive.value(context, mobile: 50.0, tablet: 80.0, desktop: 100.0),
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy',
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
                    'How we protect your personal information',
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
                      'Effective: September 6, 2025',
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
              padding: Responsive.sectionPadding(context),
              constraints: BoxConstraints(
                maxWidth: Responsive.maxContentWidth(context),
              ),
              // color: AppTheme.surfaceWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'At X Matez, we value and respect your privacy. This Privacy Policy outlines how we collect, use, store, and protect your personal information when you use our mobile application and related services.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 16 : 18,
                      height: 1.6,
                      letterSpacing: 0.2,
                    ),
                  ),
                  _Section(
                    title: 'INFORMATION WE COLLECT',
                    children: [
                      _SubSection(
                        title: 'Personal Information',
                        content:
                            'We may collect the following types of personal information:\n\n'
                            '• Identity Information: Full name, username, date of birth, gender\n'
                            '• Contact Details: Email address, phone number, postal address, city/region\n'
                            '• Financial Information: Payment card details, billing information, transaction history (processed securely through our payment processors)\n'
                            '• Profile Data: User preferences, account settings, service selections',
                      ),
                      _SubSection(
                        title: 'Technical Information',
                        content:
                            'Our app automatically collects certain technical data:\n\n'
                            '• Device Information: Device type, operating system, unique device identifiers\n'
                            '• Usage Analytics: App interaction patterns, feature usage, session duration\n'
                            '• Network Data: IP address, browser type, connection information',
                      ),
                      _SubSection(
                        title: 'App Permissions',
                        content:
                            'To provide our services effectively, our application may request access to:\n\n'
                            '• Device storage (for saving user content and app data)\n'
                            '• Camera and photo library (for profile pictures and content sharing)\n'
                            '• Microphone (for voice features, if applicable)\n'
                            '• Contacts (for connecting with friends, if enabled)\n'
                            '• Push notifications (for service updates and communications)',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PURPOSE OF DATA COLLECTION',
                    children: [
                      Text(
                        'We collect and process your information for the following legitimate purposes:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _SubSection(
                        title: 'Service Delivery',
                        content:
                            '• Providing and maintaining our core app functionality\n'
                            '• Creating and managing your user account\n'
                            '• Processing transactions and delivering purchased services\n'
                            '• Customizing your app experience based on preferences',
                      ),
                      _SubSection(
                        title: 'Communication',
                        content:
                            '• Sending important service notifications and updates\n'
                            '• Responding to your inquiries and support requests\n'
                            '• Providing customer service assistance\n'
                            '• Delivering promotional content (with your consent)',
                      ),
                      _SubSection(
                        title: 'Legal and Security',
                        content:
                            '• Complying with applicable laws and regulations\n'
                            '• Protecting against fraud, abuse, and security threats\n'
                            '• Enforcing our terms of service\n'
                            '• Maintaining accurate records as required by law',
                      ),
                      _SubSection(
                        title: 'Improvement and Analytics',
                        content:
                            '• Analyzing app performance and user engagement\n'
                            '• Identifying and fixing technical issues\n'
                            '• Developing new features and improving existing ones\n'
                            '• Conducting research to enhance user experience',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'HOW WE USE YOUR INFORMATION',
                    children: [
                      _SubSection(
                        title: 'Internal Operations',
                        content:
                            'Your information helps us operate and improve our services. We use data analytics to understand user behavior, optimize app performance, and develop new features that better serve our community.',
                      ),
                      _SubSection(
                        title: 'Personalization',
                        content:
                            'We may use your information to personalize your experience, including customized content recommendations, targeted advertisements, and relevant service suggestions based on your interests and usage patterns.',
                      ),
                      _SubSection(
                        title: 'Communication Preferences',
                        content:
                            'We respect your communication preferences. You can opt out of non-essential communications at any time through your account settings or by contacting our support team at xmatezsolutionpvtlimited390@gmail.com.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DATA SHARING AND DISCLOSURE',
                    children: [
                      _SubSection(
                        title: 'Third-Party Services',
                        content:
                            'We may share your information with trusted third-party service providers who assist us in operating our app, including:\n\n'
                            '• Payment processors for secure transaction handling\n'
                            '• Analytics providers for app performance monitoring\n'
                            '• Cloud storage services for data backup and security\n'
                            '• Customer support platforms for user assistance',
                      ),
                      _SubSection(
                        title: 'Legal Requirements',
                        content:
                            'We may disclose your information when required by law, court order, or government regulation, or when we believe disclosure is necessary to protect our rights, your safety, or the safety of others.',
                      ),
                      _SubSection(
                        title: 'Business Transfers',
                        content:
                            'In the event of a merger, acquisition, or sale of business assets, user information may be transferred as part of the transaction, subject to equivalent privacy protections.',
                      ),
                      _SubSection(
                        title: 'No Sale of Personal Data',
                        content:
                            'We do not sell, rent, or trade your personal information to third parties for their marketing purposes.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'THIRD-PARTY LINKS AND SERVICES',
                    children: [
                      Text(
                        'Our app may contain links to external websites, services, or applications operated by third parties. We are not responsible for the privacy practices or content of these external services. We encourage you to review the privacy policies of any third-party services you access through our app.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DATA SECURITY',
                    children: [
                      Text(
                        'We implement industry-standard security measures to protect your personal information, including:\n\n'
                        '• Encryption of sensitive data during transmission and storage\n'
                        '• Regular security audits and vulnerability assessments\n'
                        '• Access controls limiting data access to authorized personnel only\n'
                        '• Secure data centers with physical and digital protections\n\n'
                        'However, no method of transmission or storage is 100% secure. While we strive to protect your information, we cannot guarantee absolute security.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'COOKIES AND TRACKING',
                    children: [
                      _SubSection(
                        title: 'Cookie Usage',
                        content:
                            'Our app uses cookies and similar tracking technologies to enhance your experience. These may include:\n\n'
                            '• Essential Cookies: Required for basic app functionality\n'
                            '• Performance Cookies: Help us analyze app usage and performance\n'
                            '• Preference Cookies: Remember your settings and preferences',
                      ),
                      _SubSection(
                        title: 'Managing Cookies',
                        content:
                            'You can control cookie settings through your device or browser settings. Disabling certain cookies may affect app functionality.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'YOUR PRIVACY RIGHTS',
                    children: [
                      Text(
                        'Depending on your location, you may have the following rights regarding your personal information:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _SubSection(
                        title: 'Access and Portability',
                        content:
                            '• Request a copy of all personal data we hold about you\n'
                            '• Receive your data in a portable, machine-readable format',
                      ),
                      _SubSection(
                        title: 'Correction and Updates',
                        content:
                            '• Request correction of inaccurate or outdated information\n'
                            '• Update your profile information through account settings',
                      ),
                      _SubSection(
                        title: 'Deletion and Erasure',
                        content:
                            '• Request deletion of your personal information\n'
                            '• Close your account and remove associated data',
                      ),
                      _SubSection(
                        title: 'Consent Management',
                        content:
                            '• Withdraw consent for data processing at any time\n'
                            '• Opt out of marketing communications\n'
                            '• Modify app permissions through device settings',
                      ),
                      _SubSection(
                        title: 'Objection and Restriction',
                        content:
                            '• Object to certain types of data processing\n'
                            '• Request restriction of data processing in specific circumstances',
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'To exercise these rights, please contact us at xmatezsolutionpvtlimited390@gmail.com.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DATA RETENTION',
                    children: [
                      Text(
                        'We retain your personal information only as long as necessary to fulfill the purposes outlined in this policy or as required by law. When information is no longer needed, we securely delete or anonymize it.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _SubSection(
                        title: 'Retention Periods',
                        content:
                            '• Account information: Retained while your account is active\n'
                            '• Transaction records: Retained as required by financial regulations\n'
                            '• Usage analytics: Anonymized and retained for service improvement\n'
                            '• Support communications: Retained for quality assurance purposes',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'INTERNATIONAL DATA TRANSFERS',
                    children: [
                      Text(
                        'If we transfer your data internationally, we ensure appropriate safeguards are in place to protect your information in accordance with applicable privacy laws.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CHILDREN\'S PRIVACY',
                    children: [
                      Text(
                        'Our app is intended for users aged 18 years and above only. We do not knowingly collect personal information from individuals under 18 years of age. If we become aware that we have collected such information, we will take immediate steps to delete it.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _SubSection(
                        title: 'Age Restriction Notice',
                        content:
                            'By using X Matez, you confirm that you are at least 18 years of age. If you are under 18, you must immediately discontinue use of our services.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PRIVACY POLICY UPDATES',
                    children: [
                      Text(
                        'We may update this Privacy Policy periodically to reflect changes in our practices or applicable laws. We will notify you of significant changes through:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• In-app notifications\n'
                        '• Email notifications (if you have provided an email address)\n'
                        '• Updates posted on our website\n\n'
                        'Your continued use of our app after policy updates constitutes acceptance of the revised terms.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'LEGAL COMPLIANCE',
                    children: [
                      Text(
                        'This Privacy Policy complies with applicable privacy laws and regulations, including but not limited to:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• General Data Protection Regulation (GDPR) for EU users\n'
                        '• California Consumer Privacy Act (CCPA) for California residents\n'
                        '• Indian Information Technology Act, 2000 and related rules\n'
                        '• Other applicable local and international privacy laws',
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
    final isMobile = Responsive.isMobile(context);
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
                      SizedBox(height: isMobile ? 16 : 20),
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
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                      SizedBox(height: isMobile ? 16 : 20),
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
