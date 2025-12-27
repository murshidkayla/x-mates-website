import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../../application/providers/ui_state_provider.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: Column(
        children: [
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
                    const SizedBox(height: 20),
                    _RichFooterLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                    ),
                    const SizedBox(height: 20),
                    _RichFooterLink(
                      label: 'Contact',
                      route: '/contact',
                    ),
                    const SizedBox(height: 20),
                    _RichFooterLink(
                      label: 'How to delete',
                      route: '/how-to-delete',
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RichFooterLink(
                      label: 'Privacy Policy',
                      route: '/privacy-policy',
                    ),
                    const SizedBox(width: 32),
                    _RichFooterLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                    ),
                    const SizedBox(width: 32),
                    _RichFooterLink(
                      label: 'Contact',
                      route: '/contact',
                    ),
                    const SizedBox(width: 32),
                    _RichFooterLink(
                      label: 'How to delete',
                      route: '/how-to-delete',
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 32),
          Text(
            '© 2025 X Matez. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
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
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String _hoverKey;

  @override
  void initState() {
    super.initState();
    _hoverKey = 'footer_link_${widget.route}';
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
    return Consumer<UIStateProvider>(
      builder: (context, uiState, child) {
        final isHovered = uiState.isHovered(_hoverKey);
        
        return MouseRegion(
          onEnter: (_) {
            uiState.setHovered(_hoverKey, true);
            _controller.forward();
          },
          onExit: (_) {
            uiState.setHovered(_hoverKey, false);
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isHovered
                      ? Colors.white.withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: isHovered ? Colors.white : Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    fontWeight: isHovered ? FontWeight.w700 : FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
