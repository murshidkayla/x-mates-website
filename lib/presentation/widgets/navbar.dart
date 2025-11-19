import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import 'logo.dart';
import '../theme/app_theme.dart';

class Navbar extends StatefulWidget {
  final String currentRoute;

  const Navbar({
    super.key,
    this.currentRoute = '/',
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMobileMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWhite,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.borderLight,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                  Provider.of<NavigationProvider>(context, listen: false).setCurrentRoute('/');
                  setState(() => _isMobileMenuOpen = false);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const XMatezLogo(
                    size: 160,
                  ),
                ),
              ),
              const Spacer(),
              if (!isMobile)
                Row(
                  children: [
                    _RichNavLink(
                      label: 'Home',
                      route: '/',
                      isActive: widget.currentRoute == '/',
                    ),
                    const SizedBox(width: 40),
                    _RichNavLink(
                      label: 'Privacy Policy',
                      route: '/privacy-policy',
                      isActive: widget.currentRoute == '/privacy-policy',
                    ),
                    const SizedBox(width: 40),
                    _RichNavLink(
                      label: 'Terms & Conditions',
                      route: '/terms-conditions',
                      isActive: widget.currentRoute == '/terms-conditions',
                    ),
                    const SizedBox(width: 40),
                    _RichNavLink(
                      label: 'Contact',
                      route: '/contact',
                      isActive: widget.currentRoute == '/contact',
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
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                children: [
                  _RichNavLink(
                    label: 'Home',
                    route: '/',
                    isActive: widget.currentRoute == '/',
                    onTap: () => setState(() => _isMobileMenuOpen = false),
                  ),
                  const SizedBox(height: 24),
                  _RichNavLink(
                    label: 'Privacy Policy',
                    route: '/privacy-policy',
                    isActive: widget.currentRoute == '/privacy-policy',
                    onTap: () => setState(() => _isMobileMenuOpen = false),
                  ),
                  const SizedBox(height: 24),
                  _RichNavLink(
                    label: 'Terms & Conditions',
                    route: '/terms-conditions',
                    isActive: widget.currentRoute == '/terms-conditions',
                    onTap: () => setState(() => _isMobileMenuOpen = false),
                  ),
                  const SizedBox(height: 24),
                  _RichNavLink(
                    label: 'Contact',
                    route: '/contact',
                    isActive: widget.currentRoute == '/contact',
                    onTap: () => setState(() => _isMobileMenuOpen = false),
                  ),
                ],
              ),
            ),
        ],
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
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: widget.isActive
                  ? AppTheme.accentBlue.withValues(alpha: 0.14)
                  : (_isHovered ? AppTheme.accentBlue.withValues(alpha: 0.06) : Colors.transparent),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.isActive
                    ? AppTheme.accentBlue
                    : (_isHovered ? AppTheme.accentBlue.withValues(alpha: 0.8) : AppTheme.textPrimary),
                fontSize: 17,
                fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}





