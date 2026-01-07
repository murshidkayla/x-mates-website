import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../application/providers/navigation_provider.dart';
import '../widgets/pandora_navbar.dart';
import '../widgets/pandora_button.dart';
import '../widgets/modern_chat_card.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

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
    final isMobile = Responsive.isMobile(context);
    
    return Scaffold(
      backgroundColor: isMobile ? AppTheme.lightBackground : Colors.transparent,
      body: Container(
        width: double.infinity,
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
              // Simple Header Section
              Container(
                width: double.infinity,
                padding: Responsive.sectionPadding(context),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'GET IN TOUCH',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: Responsive.fontSize(
                          context,
                          mobile: 36.0,
                          tablet: 42.0,
                          desktop: 48.0,
                        ),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
                    Text(
                      'Send us a message and we\'ll get back to you as soon as possible',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.95),
                        fontSize: Responsive.fontSize(
                          context,
                          mobile: 16.0,
                          tablet: 17.0,
                          desktop: 18.0,
                        ),
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Content Section
              const _ContactInfoSection(),
              _ContactFormSection(
                formKey: _formKey,
                nameController: _nameController,
                emailController: _emailController,
                messageController: _messageController,
                onSubmit: _launchEmailWithFormData,
              ),
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
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final VoidCallback onSubmit;

  const _ContactFormSection({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.sectionPadding(context),
      child: ModernChatCard(
        padding: EdgeInsets.all(
          Responsive.value(context, mobile: 20.0, tablet: 26.0, desktop: 32.0),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SEND US A MESSAGE',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: Responsive.fontSize(
                    context,
                    mobile: 24.0,
                    tablet: 28.0,
                    desktop: 32.0,
                  ),
                  color: AppTheme.textPrimary,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Responsive.spacing(context, mobile: 24.0, desktop: 32.0)),
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
              SizedBox(height: Responsive.spacing(context, mobile: 24.0, desktop: 32.0)),
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
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    return Container(
      padding: Responsive.sectionPadding(context),
      constraints: BoxConstraints(
        maxWidth: Responsive.maxContentWidth(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CONTACT INFORMATION',
            style: GoogleFonts.poppins(
              color: AppTheme.textPrimary,
              fontSize: Responsive.fontSize(
                context,
                mobile: 28.0,
                tablet: 32.0,
                desktop: 36.0,
              ),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Responsive.spacing(context, mobile: 16.0, desktop: 20.0)),
          Text(
            'XMATEZ SOLUTION PRIVATE LIMITED',
            style: GoogleFonts.poppins(
              color: AppTheme.textPrimary.withOpacity(0.8),
              fontSize: Responsive.fontSize(
                context,
                mobile: 16.0,
                tablet: 17.0,
                desktop: 18.0,
              ),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Responsive.spacing(context, mobile: 32.0, desktop: 40.0)),
          isMobile
              ? Column(
                  children: [
                    _ContactInfoCard(
                      icon: Icons.location_on_rounded,
                      title: 'Address',
                      info: 'Building No. C020 67/1717,\nSpace c, bhageeratha square,\nErnakulam north,\nErnakulam - 682018',
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _ContactInfoCard(
                        icon: Icons.location_on_rounded,
                        title: 'Address',
                        info: 'Building No. C020 67/1717,\nSpace c, bhageeratha square,\nErnakulam north,\nErnakulam - 682018',
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: Responsive.spacing(context, mobile: 16.0, desktop: 24.0)),
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
                    SizedBox(width: Responsive.spacing(context, mobile: 16.0, desktop: 24.0)),
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
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: ModernChatCard(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.primaryColor,
                  size: 30,
                ),
              ),
              SizedBox(height: 20),
              Text(
                title.toUpperCase(),
                style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppTheme.textPrimary,
                  letterSpacing: 0.5,
                    ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: Text(
                    info,
                    style: GoogleFonts.poppins(
                      color: AppTheme.textPrimary.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                          fontSize: 13,
                      height: 1.5,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

