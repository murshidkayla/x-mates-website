import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';

class CommunityGuidelinesPage extends StatelessWidget {
  const CommunityGuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    
    // Set route when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/community-guidelines');
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Community Guidelines',
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
                    'Building a safe and respectful community',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: isMobile ? 16 : 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            // Ultra-Modern Content Section
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 80,
                  vertical: isMobile ? 40 : 60,
                ),
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 1000,
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xmatez is a platform designed to build meaningful connections and promote genuine engagement within a safe, inclusive, and respectful community.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 16 : 18,
                      height: 1.6,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    'To support this mission, we have created Community Guidelines that serve as the foundation for a positive user experience. These guidelines clearly outline the types of unacceptable content and behavior—both on and off the platform—to help ensure user safety.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 15 : 17,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    'By following these rules, you contribute to a thriving community that values diversity, encourages constructive interactions, and provides a safe space for everyone.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: isMobile ? 15 : 17,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    'Violating these guidelines may result in actions such as content removal, account suspension or termination, or reporting to authorities. These actions are necessary to maintain the integrity and well-being of the platform.',
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
                            'Please note that these guidelines are not exhaustive, and additional behaviors may also be considered violations. Serious breaches may lead to legal consequences under Indian law.',
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
                  _Section(
                    title: 'PROFILE GUIDELINES',
                    children: [
                      _SubSection(
                        title: 'Age Requirement:',
                        content:
                            'You must be 18 years or older to use Xmatez. Creating a profile with a false age, fake identity, or any misleading information is strictly prohibited.\n\n'
                            'We may request ID verification at any time to ensure authenticity. Users found to be underage or providing false details will be restricted or permanently blocked from the platform.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CONTENT AND CONDUCT GUIDELINES',
                    children: [
                      Text(
                        'We maintain strict standards on what type of content and conduct are allowed. This includes prohibitions on:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      _SubSection(
                        title: 'Adult Nudity and Sexual Activity',
                        content:
                            'Xmatez does not permit any form of adult nudity, sexual content, or sexually suggestive behavior in profiles, messages, or interactions.\n'
                            ' Any attempt to:\n\n'
                            '• Share or request sexual content,\n'
                            '• Engage in sexually explicit conversations, or\n'
                            '• Offer, promote, or purchase romantic or sexual services is strictly prohibited.\n\n'
                            'We also do not allow any commercial exchange involving adult material or sexual activity. Violations may result in content removal, account suspension, or permanent account termination.',
                      ),
                      _SubSection(
                        title: 'Harassment and Bullying',
                        content:
                            'Xmatez has zero tolerance for any form of harassment, abuse, or harmful behavior. This includes:\n\n'
                            '• Abusive Language: Using offensive, threatening, or vulgar words during audio calls.\n'
                            '• Discrimination: Harassing, insulting, or targeting someone based on gender, race, religion, caste, ethnicity, or any personal characteristic.\n'
                            '• Non-Consensual Sharing: Capturing, sharing, or distributing someone\'s images, audio, or recordings without their clear permission.\n\n'
                            'Any violation may result in immediate action, including warnings, restrictions, or permanent account suspension.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PROHIBITED ACTIONS AND CONTENT',
                    children: [
                      Text(
                        'The following actions and types of content are strictly not allowed on Xmatez:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      _SubSection(
                        title: 'Bullying or Threats',
                        content:
                            'Any form of intimidation, harassment, or threatening behavior during conversations.',
                      ),
                      _SubSection(
                        title: 'Nudity or Sexual Gestures',
                        content:
                            'Suggesting, or requesting any sexual, explicit, or inappropriate actions.',
                      ),
                      _SubSection(
                        title: 'Inappropriate Language or Behavior',
                        content:
                            'Using vulgar, abusive, or disrespectful words, or engaging in offensive conduct.',
                      ),
                      _SubSection(
                        title: 'Hate Speech or Religious Insults',
                        content:
                            'Comments that target or insult individuals or groups based on religion, caste, community, nationality, gender, or ethnicity.',
                      ),
                      _SubSection(
                        title: 'Violence or Abuse',
                        content:
                            'Promoting, encouraging, or engaging in violent or abusive actions in any form.',
                      ),
                      _SubSection(
                        title: 'Self-Harm or Disturbing Content',
                        content:
                            'Sharing or discussing self-harm, suicide, or any disturbing or harmful content.',
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      Text(
                        'Violating these rules may lead to warnings, temporary restrictions, or permanent account termination.',
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
                    title: 'GENERAL GUIDELINES FOR ALL USERS',
                    children: [
                      _SubSection(
                        title: 'Age Restriction',
                        content:
                            'Only users who are 18 years or older are permitted to use Xmatez.',
                      ),
                      _SubSection(
                        title: 'Respect Others',
                        content:
                            'Do not share anyone\'s personal information, images, or recordings without their clear consent.',
                      ),
                      _SubSection(
                        title: 'Follow Laws',
                        content:
                            'Ensure all your actions comply with applicable local and national laws.',
                      ),
                      _SubSection(
                        title: 'Report Issues',
                        content:
                            'If you experience or witness any violation, please report it to us at xmatezsolutionpvtlimited390@gmail.com.',
                      ),
                    ],
                  ),
                  _Section(
                    title: 'COMMERCIAL EXCHANGE PROHIBITED',
                    children: [
                      Text(
                        'Xmatez cannot be used for commercial exchange of sexual or romantic acts, including:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Selling or buying any form of sexual or romantic interaction through audio calls.\n'
                        '• Promoting adult websites, external sexual services, or paid romantic interactions.\n'
                        '• Offering or requesting romantic, intimate, or sexual engagement in exchange for money, gifts, or any benefits.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SEXUAL HARASSMENT',
                    children: [
                      Text(
                        'All forms of sexual harassment are prohibited, including:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Unwanted sexual comments, remarks, or advances during conversations.\n'
                        '• Making sexually suggestive sounds or gestures during calls.\n'
                        '• Pressuring someone into sexual conversation or explicit topics without consent.\n'
                        '• Fetishizing or objectifying someone in a sexual manner.\n'
                        '• Sharing or requesting private sexual content (such as recordings or personal details) during or after the call.\n'
                        '• Any attempt to engage in sexual behavior through calls, even indirectly.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      Text(
                        'Any sexual harassment, even off-platform, may result in account suspension or reporting to authorities.',
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
                    title: 'BULLYING AND ABUSIVE BEHAVIOR',
                    children: [
                      Text(
                        'Xmatez has zero tolerance for any form of harassment, humiliation, or intimidation. This includes blackmail, emotional abuse, or repeatedly contacting someone after they\'ve asked you to stop.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      Text(
                        'Members must not:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Bully, troll, insult, or mock other users.\n'
                        '• Body shame or make negative comments about someone\'s appearance.\n'
                        '• Encourage, promote, or glorify violence or harmful behavior.\n'
                        '• Leak someone\'s private information or use it for threats or blackmail.\n'
                        '• Share content that is disrespectful toward victims or survivors of abuse or trauma.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'CHILD SEXUAL EXPLOITATION AND ABUSE',
                    children: [
                      Text(
                        'Xmatez has zero tolerance for any form of child sexual content, exploitation, or abuse.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• Children under 18 must not appear alone in profile photos or be featured in any content.\n\n'
                        'Any violation will result in permanent account removal and reporting to the appropriate authorities.',
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
                    title: 'CONTROLLED GOODS AND SUBSTANCES',
                    children: [
                      Text(
                        'No buying, selling, or promoting drugs, alcohol, or other controlled substances on Xmatez.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'DANGEROUS ORGANIZATIONS AND INDIVIDUALS',
                    children: [
                      Text(
                        'No glorifying or promoting terrorism, violence, or hate groups.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'IDENTITY-BASED HATE',
                    children: [
                      Text(
                        'Xmatez strictly prohibits any form of hate, discrimination, or dehumanization based on race, caste, gender, sexuality, religion, or disability.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'FAKE OR MISLEADING PROFILES',
                    children: [
                      Text(
                        'Users must not impersonate others, create fake identities, or provide misleading profile information.\n'
                        'Your profile should accurately represent who you are.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'MISINFORMATION',
                    children: [
                      Text(
                        'Users must not share false, misleading, or harmful information, including health misinformation, rumors, or fake news.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PHYSICAL OR SEXUAL VIOLENCE',
                    children: [
                      Text(
                        'Xmatez does not tolerate any content or behavior that promotes violence, sexual assault, or exploitation.\n'
                        'This includes, but is not limited to, stalking, trafficking, intimidation, or threats of harm.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SCAMS AND FRAUD',
                    children: [
                      Text(
                        'Xmatez strictly prohibits all forms of scams or fraudulent activity, including romantic, financial, or identity-based scams.\n'
                        'Any attempt to deceive users for money, personal gain, or other benefits will result in immediate action, including account suspension or termination.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SELF-HARM AND SUICIDE',
                    children: [
                      Text(
                        'Do not promote, glorify, or share instructions related to self-harm, suicide, or eating disorders.\n'
                        'Do not post graphic or distressing content.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'PLATFORM MANIPULATION',
                    children: [
                      Text(
                        'Users must not use bots, scripts, or any fake activity to manipulate calls, interactions, or engagement metrics.\n'
                        'Any attempt to artificially influence the platform will result in account restrictions or termination.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  _Section(
                    title: 'SAFETY REPORTING',
                    children: [
                      Text(
                        'Xmatez employs moderation and automated systems to help maintain a safe environment for all users.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      Text(
                        'Members are encouraged to block and report anyone who violates these guidelines.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: isMobile ? 10 : 14),
                      Text(
                        '• False or abusive reports may lead to account penalties.\n'
                        '• For serious violations, we may cooperate with law enforcement to ensure appropriate action is taken.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 15 : 17,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 28 : 42),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isMobile ? 20 : 24),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppTheme.primaryColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppTheme.primaryColor,
                          size: isMobile ? 20 : 24,
                        ),
                        SizedBox(width: isMobile ? 12 : 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'For concerns, contact',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontSize: isMobile ? 15 : 17,
                                  height: 1.6,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: isMobile ? 8 : 12),
                              SelectableText(
                                'xmatezsolutionpvtlimited390@gmail.com',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontSize: isMobile ? 14 : 17,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
    final isMobile = MediaQuery.of(context).size.width <= 768;
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

