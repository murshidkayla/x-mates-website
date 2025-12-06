import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
        color: AppTheme.primaryBlack,
        border: Border(
          top: BorderSide(color: AppTheme.darkGray, width: 1),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accentBlue.withValues(alpha: 0.18),
                  blurRadius: 60,
                  spreadRadius: 12,
                ),
              ],
            ),
           
          ),
          const SizedBox(height: 64),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 768;
              if (isMobile) {
                return Column(
                  children: [
                    _RichFooterLink(
                      label: 'Privacy Policy',
                      route: '/privacy-policy',
                    ),
                    const SizedBox(height: 24),
                    _RichFooterLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                    ),
                    const SizedBox(height: 24),
                    _RichFooterLink(
                      label: 'Contact',
                      route: '/contact',
                    ),
                    const SizedBox(height: 24),
                    _RichFooterLink(
                      label: 'How to delete',
                      route: '/how-to-delete',
                    ),
                  ],
                );
              } else {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 48,
                  children: [
                    _RichFooterLink(
                      label: 'Privacy Policy',
                      route: '/privacy-policy',
                    ),
                    _RichFooterLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                    ),
                    _RichFooterLink(
                      label: 'Contact',
                      route: '/contact',
                    ),
                    _RichFooterLink(
                      label: 'How to delete',
                      route: '/how-to-delete',
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 80),
          const Divider(
            color: AppTheme.darkGray,
            thickness: 1,
          ),
          const SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Text(
                '© 2025 X Matez. All rights reserved.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.78),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RichFooterLink extends StatefulWidget {
  final String label;
  final String route;

  const _RichFooterLink({
    required this.label,
    required this.route,
  });

  @override
  State<_RichFooterLink> createState() => _RichFooterLinkState();
}

class _RichFooterLinkState extends State<_RichFooterLink> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
          child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(widget.route);
            Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute(widget.route);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: _isHovered ? 1.0 : 0.85),
                fontSize: 17,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
