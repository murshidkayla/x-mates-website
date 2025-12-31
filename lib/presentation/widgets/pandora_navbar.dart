import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../application/providers/navigation_provider.dart';
import '../../application/providers/ui_state_provider.dart';
import '../utils/responsive.dart';

class PandoraNavbar extends StatefulWidget {
  const PandoraNavbar({super.key});

  @override
  State<PandoraNavbar> createState() => _PandoraNavbarState();
}

class _PandoraNavbarState extends State<PandoraNavbar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final currentRoute = Provider.of<NavigationProvider>(context).currentRoute;

    return Consumer<UIStateProvider>(
      builder: (context, uiState, child) {
        final isMobileMenuOpen = uiState.isMobileMenuOpen;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Container(
            key: ValueKey(currentRoute),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : (isTablet ? 24 : 40),
              vertical: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isMobile)
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _NavLink(
                              label: 'Home',
                              route: '/',
                              isActive: currentRoute == '/',
                              currentRoute: currentRoute,
                            ),
                            SizedBox(width: isTablet ? 16 : 28),
                            _NavLink(
                              label: 'Privacy',
                              route: '/privacy-policy',
                              isActive: currentRoute == '/privacy-policy',
                              currentRoute: currentRoute,
                            ),
                            SizedBox(width: isTablet ? 16 : 28),
                            _NavLink(
                              label: 'Terms',
                              route: '/terms-conditions',
                              isActive: currentRoute == '/terms-conditions',
                              currentRoute: currentRoute,
                            ),
                            if (!isTablet) ...[
                              const SizedBox(width: 28),
                              _NavLink(
                                label: 'Community Guidelines',
                                route: '/community-guidelines',
                                isActive: currentRoute == '/community-guidelines',
                                currentRoute: currentRoute,
                              ),
                            ],
                            SizedBox(width: isTablet ? 16 : 28),
                            _NavLink(
                              label: 'Contact',
                              route: '/contact',
                              isActive: currentRoute == '/contact',
                              currentRoute: currentRoute,
                            ),
                          ],
                        ),
                      )
                    else
                      IconButton(
                        icon: Icon(
                          isMobileMenuOpen ? Icons.close : Icons.menu,
                          color: const Color.fromRGBO(66, 107, 112, 1),
                          size: 28,
                        ),
                        onPressed: () {
                          uiState.toggleMobileMenu();
                        },
                      ),
                  ],
                ),
                if (isMobile && isMobileMenuOpen)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        _NavLink(
                          label: 'Home',
                          route: '/',
                          isActive: currentRoute == '/',
                          currentRoute: currentRoute,
                          onTap: () => uiState.setMobileMenuOpen(false),
                        ),
                        const SizedBox(height: 16),
                        _NavLink(
                          label: 'Privacy',
                          route: '/privacy-policy',
                          isActive: currentRoute == '/privacy-policy',
                          currentRoute: currentRoute,
                          onTap: () => uiState.setMobileMenuOpen(false),
                        ),
                        const SizedBox(height: 16),
                        _NavLink(
                          label: 'Terms',
                          route: '/terms-conditions',
                          isActive: currentRoute == '/terms-conditions',
                          currentRoute: currentRoute,
                          onTap: () => uiState.setMobileMenuOpen(false),
                        ),
                        const SizedBox(height: 16),
                        _NavLink(
                          label: 'Community Guidelines',
                          route: '/community-guidelines',
                          isActive: currentRoute == '/community-guidelines',
                          currentRoute: currentRoute,
                          onTap: () => uiState.setMobileMenuOpen(false),
                        ),
                        const SizedBox(height: 16),
                        _NavLink(
                          label: 'Contact',
                          route: '/contact',
                          isActive: currentRoute == '/contact',
                          currentRoute: currentRoute,
                          onTap: () => uiState.setMobileMenuOpen(false),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  final bool isActive;
  final String currentRoute;
  final VoidCallback? onTap;

  const _NavLink({
    required this.label,
    required this.route,
    required this.isActive,
    required this.currentRoute,
    this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _underlineAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _underlineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _colorAnimation = ColorTween(
      begin: const Color.fromRGBO(66, 107, 112, 0.7),
      end: const Color.fromRGBO(66, 107, 112, 0.9),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
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
    final uiState = Provider.of<UIStateProvider>(context);
    final hoverKey = 'nav_${widget.route}';
    final isHovered = uiState.isHovered(hoverKey);

    return MouseRegion(
      onEnter: (_) {
        uiState.setHovered(hoverKey, true);
        if (!widget.isActive) {
          _controller.forward();
        }
      },
      onExit: (_) {
        uiState.setHovered(hoverKey, false);
        if (!widget.isActive) {
          _controller.reverse();
        }
      },
      child: GestureDetector(
        onTap: () {
          // Smooth navigation with animation
          Provider.of<NavigationProvider>(context, listen: false)
              .setCurrentRoute(widget.route);
          Navigator.of(context).pushReplacementNamed(widget.route);
          widget.onTap?.call();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return AnimatedScale(
              scale: isHovered ? _scaleAnimation.value : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // Smooth color transition when navigating between pages
                      Color color;
                      if (widget.isActive) {
                        // Active state - full opacity
                        color = const Color.fromRGBO(66, 107, 112, 1);
                      } else if (isHovered) {
                        // Hover state - use animation color
                        color = _colorAnimation.value ?? const Color.fromRGBO(66, 107, 112, 0.9);
                      } else {
                        // Default state - lower opacity
                        color = const Color.fromRGBO(66, 107, 112, 0.7);
                      }
                      
                      return AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
              style: GoogleFonts.poppins(
                          color: color,
                fontSize: 16,
                          fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w600,
                letterSpacing: 0.3,
              ),
                        child: Text(widget.label),
                      );
                    },
            ),
                  const SizedBox(height: 4),
            AnimatedBuilder(
              animation: _underlineAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _underlineAnimation.value,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(66, 107, 112, 1),
                      shape: BoxShape.circle,
                            boxShadow: widget.isActive
                                ? [
                                    BoxShadow(
                                      color: const Color.fromRGBO(66, 107, 112, 0.4),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                    ),
                  ),
                );
              },
            ),
          ],
              ),
            );
          },
        ),
      ),
    );
  }
}
