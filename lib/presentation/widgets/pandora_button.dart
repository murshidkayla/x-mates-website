import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PandoraButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isOutlined;
  final bool isLarge;
  final IconData? icon;

  const PandoraButton({
    super.key,
    required this.label,
    this.onTap,
    this.isOutlined = false,
    this.isLarge = false,
    this.icon,
  });

  @override
  State<PandoraButton> createState() => _PandoraButtonState();
}

class _PandoraButtonState extends State<PandoraButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
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
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.isLarge ? 44 : 36,
                vertical: widget.isLarge ? 20 : 18,
              ),
              decoration: BoxDecoration(
                gradient: widget.isOutlined
                    ? null
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColorDark,
                        ],
                      ),
                color: widget.isOutlined ? Colors.transparent : null,
                borderRadius: BorderRadius.circular(14),
                border: widget.isOutlined
                    ? Border.all(
                        color: AppTheme.primaryColor,
                        width: 2,
                      )
                    : null,
                boxShadow: !widget.isOutlined
                    ? [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(
                            0.25 + (0.15 * _elevationAnimation.value),
                          ),
                          blurRadius: 12 + (8 * _elevationAnimation.value),
                          offset: Offset(0, 6 + (4 * _elevationAnimation.value)),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.05 * _elevationAnimation.value,
                          ),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      color: widget.isOutlined
                          ? AppTheme.primaryColor
                          : Colors.white,
                      size: widget.isLarge ? 20 : 18,
                    ),
                    SizedBox(width: 12),
                  ],
                  Flexible(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: widget.isOutlined
                            ? AppTheme.primaryColor
                            : Colors.white,
                        fontSize: widget.isLarge ? 17 : 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
