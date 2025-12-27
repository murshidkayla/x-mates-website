import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/ui_state_provider.dart';
import '../theme/app_theme.dart';

class ModernChatCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool showShadow;
  final bool hasHover;

  const ModernChatCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.backgroundColor,
    this.showShadow = true,
    this.hasHover = true,
  });

  @override
  State<ModernChatCard> createState() => _ModernChatCardState();
}

class _ModernChatCardState extends State<ModernChatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;
  late String _hoverKey;

  @override
  void initState() {
    super.initState();
    _hoverKey = 'chat_card_${hashCode}';
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _elevationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? AppTheme.lightSurface;

    return Consumer<UIStateProvider>(
      builder: (context, uiState, child) {
        final isHovered = uiState.isHovered(_hoverKey);
        
        Widget card = AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              padding: widget.padding ?? const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isHovered && widget.hasHover
                      ? AppTheme.primaryColor.withOpacity(0.3)
                      : AppTheme.lightBorder.withOpacity(0.5),
                  width: isHovered && widget.hasHover ? 2 : 1.5,
                ),
                boxShadow: widget.showShadow
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.04 + (0.04 * _elevationAnimation.value),
                          ),
                          blurRadius: 12 + (8 * _elevationAnimation.value),
                          offset: Offset(0, 4 + (4 * _elevationAnimation.value)),
                          spreadRadius: 0,
                        ),
                        if (isHovered && widget.hasHover)
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(
                              0.08 * _elevationAnimation.value,
                            ),
                            blurRadius: 20,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                      ]
                    : null,
              ),
              child: widget.child,
            );
          },
        );

        if (widget.onTap != null) {
          card = Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(20),
              child: card,
            ),
          );
        }

        if (widget.hasHover) {
          return MouseRegion(
            onEnter: (_) {
              uiState.setHovered(_hoverKey, true);
              _controller.forward();
            },
            onExit: (_) {
              uiState.setHovered(_hoverKey, false);
              _controller.reverse();
            },
            child: card,
          );
        }

        return card;
      },
    );
  }
}
