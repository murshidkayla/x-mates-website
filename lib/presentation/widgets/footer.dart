import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../../application/providers/ui_state_provider.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    return Container(
      width: double.infinity,
      padding: Responsive.sectionPadding(context),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: Column(
        children: [
          isMobile
              ? Column(
                  children: [
                    _RichFooterLink(
                      label: 'Privacy Policy',
                      route: '/privacy-policy',
                    ),
                    SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
                    _RichFooterLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                    ),
                    SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
                    _RichFooterLink(
                      label: 'Community Guidelines',
                      route: '/community-guidelines',
                    ),
                    SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
                    _RichFooterLink(
                      label: 'Contact',
                      route: '/contact',
                    ),
                    SizedBox(height: Responsive.spacing(context, mobile: 20.0, desktop: 24.0)),
                    _RichFooterLink(
                      label: 'How to delete',
                      route: '/how-to-delete',
                    ),
                  ],
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  spacing: Responsive.spacing(context, mobile: 16.0, desktop: 32.0),
                  runSpacing: Responsive.spacing(context, mobile: 16.0, desktop: 16.0),
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
                      label: 'Community Guidelines',
                      route: '/community-guidelines',
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
                ),
          SizedBox(height: Responsive.spacing(context, mobile: 40.0, desktop: 60.0)),
          Text(
            '© 2025 X Matez. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.fontSize(
                context,
                mobile: 13.0,
                tablet: 13.5,
                desktop: 14.0,
              ),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
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
