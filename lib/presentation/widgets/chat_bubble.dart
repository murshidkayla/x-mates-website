import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;
  final String? time;
  final IconData? icon;

  const ChatBubble({
    super.key,
    required this.message,
    this.isSent = false,
    this.time,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSent
              ? AppTheme.accentBlue
              : (isDark
                  ? AppTheme.darkSurfaceElevated
                  : AppTheme.lightSurfaceElevated),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isSent ? 20 : 4),
            bottomRight: Radius.circular(isSent ? 4 : 20),
          ),
          boxShadow: [
            BoxShadow(
              color: isSent
                  ? AppTheme.accentBlue.withOpacity(0.3)
                  : Colors.black.withOpacity(isDark ? 0.2 : 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: isSent
                    ? Colors.white
                    : AppTheme.accentBlue,
                size: 24,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message,
              style: TextStyle(
                color: isSent
                    ? Colors.white
                    : (isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.lightTextPrimary),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            if (time != null) ...[
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  time!,
                  style: TextStyle(
                    color: isSent
                        ? Colors.white.withOpacity(0.7)
                        : (isDark
                            ? AppTheme.darkTextTertiary
                            : AppTheme.lightTextTertiary),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}





