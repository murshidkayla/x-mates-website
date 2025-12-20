import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/navigation_provider.dart';
import '../theme/app_theme.dart';

class PandoraNavbar extends StatefulWidget {
  const PandoraNavbar({super.key});

  @override
  State<PandoraNavbar> createState() => _PandoraNavbarState();
}

class _PandoraNavbarState extends State<PandoraNavbar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    final currentRoute = Provider.of<NavigationProvider>(context).currentRoute;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: 28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!isMobile)
            Row(
              children: [
                _NavLink(
                  label: 'Home',
                  route: '/',
                  isActive: currentRoute == '/',
                  currentRoute: currentRoute,
                ),
                const SizedBox(width: 32),
                _NavLink(
                  label: 'Privacy',
                  route: '/privacy-policy',
                  isActive: currentRoute == '/privacy-policy',
                  currentRoute: currentRoute,
                ),
                const SizedBox(width: 32),
                _NavLink(
                  label: 'Terms',
                  route: '/terms-conditions',
                  isActive: currentRoute == '/terms-conditions',
                  currentRoute: currentRoute,
                ),
                const SizedBox(width: 32),
                _NavLink(
                  label: 'Contact',
                  route: '/contact',
                  isActive: currentRoute == '/contact',
                  currentRoute: currentRoute,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  final bool isActive;
  final String currentRoute;

  const _NavLink({
    required this.label,
    required this.route,
    required this.isActive,
    required this.currentRoute,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _underlineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _underlineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    if (widget.isActive) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_NavLink oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Home page has blue background, others have white background
    final isHomePage = widget.currentRoute == '/';
    final selectedColor = isHomePage ? Colors.white : AppTheme.primaryColor;
    final unselectedColor = isHomePage 
        ? Colors.white.withOpacity(0.7) 
        : AppTheme.textPrimary;
    final hoverColor = isHomePage 
        ? Colors.white.withOpacity(0.8) 
        : AppTheme.primaryColor.withOpacity(0.7);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        if (!widget.isActive) {
          _controller.forward();
        }
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        if (!widget.isActive) {
          _controller.reverse();
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(widget.route);
          Provider.of<NavigationProvider>(context, listen: false)
              .setCurrentRoute(widget.route);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: widget.isActive
                    ? selectedColor
                    : (_isHovered
                        ? hoverColor
                        : unselectedColor),
                fontSize: 16,
                fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
            SizedBox(height: 4),
            AnimatedBuilder(
              animation: _underlineAnimation,
              builder: (context, child) {
                return Container(
                  height: 2,
                  width: 24 * _underlineAnimation.value,
                  decoration: BoxDecoration(
                    color: widget.isActive
                        ? selectedColor
                        : (_isHovered
                            ? (isHomePage 
                                ? Colors.white.withOpacity(0.6) 
                                : AppTheme.primaryColor.withOpacity(0.6))
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
