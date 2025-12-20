import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import 'logo.dart';
import '../theme/app_theme.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMobileMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    final currentRoute = Provider.of<NavigationProvider>(context).currentRoute;
    
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 140,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            // Glassmorphism navbar
            color: AppTheme.surfaceWhite.withOpacity(0.85),
            border: Border(
              bottom: BorderSide(
                color: AppTheme.borderLight.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 30,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: AppTheme.accentBlue.withValues(alpha: 0.03),
                blurRadius: 40,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const XMatezLogo(
                      size: 140,
                    ),
                  ),
                  const Spacer(),
                  if (!isMobile)
                    Row(
                      children: [
                        _RichNavLink(
                          label: 'Home',
                          route: '/',
                          isActive: currentRoute == '/',
                        ),
                        const SizedBox(width: 40),
                        _RichNavLink(
                          label: 'Privacy Policy',
                          route: '/privacy-policy',
                          isActive: currentRoute == '/privacy-policy',
                        ),
                        const SizedBox(width: 40),
                        _RichNavLink(
                          label: 'Terms & Conditions',
                          route: '/terms-conditions',
                          isActive: currentRoute == '/terms-conditions',
                        ),
                        const SizedBox(width: 40),
                        _RichNavLink(
                          label: 'Contact',
                          route: '/contact',
                          isActive: currentRoute == '/contact',
                        ),
                      ],
                    )
                  else
                    IconButton(
                      icon: Icon(
                        _isMobileMenuOpen ? Icons.close : Icons.menu,
                        color: AppTheme.textPrimary,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() => _isMobileMenuOpen = !_isMobileMenuOpen);
                      },
                    ),
                ],
              ),
              if (isMobile && _isMobileMenuOpen)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      _RichNavLink(
                        label: 'Home',
                        route: '/',
                        isActive: currentRoute == '/',
                        onTap: () => setState(() => _isMobileMenuOpen = false),
                      ),
                      const SizedBox(height: 16),
                      _RichNavLink(
                        label: 'Privacy Policy',
                        route: '/privacy-policy',
                        isActive: currentRoute == '/privacy-policy',
                        onTap: () => setState(() => _isMobileMenuOpen = false),
                      ),
                      const SizedBox(height: 16),
                      _RichNavLink(
                        label: 'Terms & Conditions',
                        route: '/terms-conditions',
                        isActive: currentRoute == '/terms-conditions',
                        onTap: () => setState(() => _isMobileMenuOpen = false),
                      ),
                      const SizedBox(height: 16),
                      _RichNavLink(
                        label: 'Contact',
                        route: '/contact',
                        isActive: currentRoute == '/contact',
                        onTap: () => setState(() => _isMobileMenuOpen = false),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RichNavLink extends StatefulWidget {
  final String label;
  final String route;
  final bool isActive;
  final VoidCallback? onTap;

  const _RichNavLink({
    required this.label,
    required this.route,
    required this.isActive,
    this.onTap,
  });

  @override
  State<_RichNavLink> createState() => _RichNavLinkState();
}

class _RichNavLinkState extends State<_RichNavLink> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
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
        if (!widget.isActive) {
          setState(() => _isHovered = true);
          _controller.forward();
        }
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
            widget.onTap?.call();
          },
            child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              gradient: widget.isActive
                  ? LinearGradient(
                      colors: [
                        AppTheme.accentBlue.withValues(alpha: 0.2),
                        AppTheme.primaryColor.withValues(alpha: 0.1),
                      ],
                    )
                  : (_isHovered
                      ? LinearGradient(
                          colors: [
                            AppTheme.accentBlue.withValues(alpha: 0.1),
                            AppTheme.primaryColor.withValues(alpha: 0.05),
                          ],
                        )
                      : null),
              color: widget.isActive || _isHovered
                  ? null
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
              border: widget.isActive
                  ? Border.all(
                      color: AppTheme.accentBlue.withValues(alpha: 0.4),
                      width: 1.5,
                    )
                  : null,
              boxShadow: widget.isActive
                  ? [
                      BoxShadow(
                        color: AppTheme.accentBlue.withValues(alpha: 0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.isActive
                    ? AppTheme.accentBlue
                    : (_isHovered
                        ? AppTheme.primaryColor
                        : AppTheme.textPrimary),
                fontSize: 17,
                fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}





