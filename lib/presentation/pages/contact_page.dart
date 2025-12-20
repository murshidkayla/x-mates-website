import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/pandora_button.dart';
import '../widgets/modern_chat_card.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false)
          .setCurrentRoute('/contact');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showEmailFallback(BuildContext context) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'No email app found. Please email us at: xmatezsolutionpvtlimited390@gmail.com',
          ),
          backgroundColor: AppTheme.accentBlue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> _launchEmailWithFormData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String message = _messageController.text.trim();

    final String emailBody = 'Name: $name\n\n'
        'Email: $email\n\n'
        'Message:\n$message';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'xmatezsolutionpvtlimited390@gmail.com',
      queryParameters: {
        'subject': 'Contact from X Matez Website',
        'body': emailBody,
      },
    );

    try {
      if (!await canLaunchUrl(emailUri)) {
        if (mounted) {
          _showEmailFallback(context);
        }
        return;
      }

      final LaunchMode launchMode = Platform.isAndroid
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault;

      final bool launched = await launchUrl(
        emailUri,
        mode: launchMode,
      );

      if (launched) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Email app opened! Your form data is pre-filled. Please review and send.',
              ),
              backgroundColor: AppTheme.accentBlue,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      } else {
        if (mounted) {
          _showEmailFallback(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could not open email app. Please email us at: xmatezsolutionpvtlimited390@gmail.com',
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 8),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

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
                      'Get in Touch',
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
                      'Send us a message and we\'ll get back to you as soon as possible',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isMobile ? 16 : 18,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Content Section
              _ContactFormSection(
                isMobile: isMobile,
                formKey: _formKey,
                nameController: _nameController,
                emailController: _emailController,
                messageController: _messageController,
                onSubmit: _launchEmailWithFormData,
              ),
              _ContactInfoSection(isMobile: isMobile),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Contact Form Section
class _ContactFormSection extends StatelessWidget {
  final bool isMobile;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final VoidCallback onSubmit;

  const _ContactFormSection({
    required this.isMobile,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: isMobile ? 30 : 40,
      ),
      child: ModernChatCard(
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Send Us a Message',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 22 : 28,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 24 : 32),
              _StandardTextField(
                controller: nameController,
                label: 'Full Name',
                hintText: 'Enter your full name',
                icon: Icons.person_outline_rounded,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _StandardTextField(
                controller: emailController,
                label: 'Email Address',
                hintText: 'your.email@example.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _StandardTextField(
                controller: messageController,
                label: 'Message',
                hintText: 'Please describe your inquiry in detail...',
                icon: Icons.message_outlined,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              SizedBox(height: isMobile ? 24 : 32),
              PandoraButton(
                label: 'Send Message',
                isLarge: true,
                onTap: onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Standard Text Field
class _StandardTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const _StandardTextField({
    required this.controller,
    required this.label,
    this.hintText,
    required this.icon,
    this.keyboardType,
    this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isMultiline = maxLines != null && maxLines! > 1;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      minLines: isMultiline ? 5 : 1,
      textAlignVertical: isMultiline ? TextAlignVertical.top : TextAlignVertical.center,
      validator: validator,
      style: TextStyle(
        color: AppTheme.lightTextPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppTheme.lightTextSecondary,
          size: 20,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: AppTheme.lightTextSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppTheme.lightTextTertiary,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.lightBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.lightBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.accentBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.accentPink, width: 1.5),
        ),
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: isMultiline ? 20 : 16,
          bottom: isMultiline ? 16 : 16,
        ),
      ),
    );
  }
}

// Contact Info Section
class _ContactInfoSection extends StatelessWidget {
  final bool isMobile;

  const _ContactInfoSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : 1000,
      ),
      child: isMobile
          ? Column(
              children: [
                _ContactInfoCard(
                  icon: Icons.email_rounded,
                  title: 'Email',
                  info: 'xmatezsolutionpvtlimited390@gmail.com',
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'xmatezsolutionpvtlimited390@gmail.com',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    }
                  },
                ),
                SizedBox(height: 16),
                _ContactInfoCard(
                  icon: Icons.phone_rounded,
                  title: 'Phone',
                  info: '+91 9495270656',
                  onTap: () async {
                    final Uri phoneUri = Uri(
                      scheme: 'tel',
                      path: '+919495270656',
                    );
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    }
                  },
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _ContactInfoCard(
                    icon: Icons.email_rounded,
                    title: 'Email',
                    info: 'xmatezsolutionpvtlimited390@gmail.com',
                    onTap: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'xmatezsolutionpvtlimited390@gmail.com',
                      );
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _ContactInfoCard(
                    icon: Icons.phone_rounded,
                    title: 'Phone',
                    info: '+91 9495270656',
                    onTap: () async {
                      final Uri phoneUri = Uri(
                        scheme: 'tel',
                        path: '+919495270656',
                      );
                      if (await canLaunchUrl(phoneUri)) {
                        await launchUrl(phoneUri);
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

// Contact Info Card
class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;
  final VoidCallback onTap;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.info,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ModernChatCard(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.accentBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: AppTheme.accentBlue,
              size: 28,
            ),
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
          ),
          SizedBox(height: 6),
          Text(
            info,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.accentBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

