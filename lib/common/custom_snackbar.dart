import 'package:flutter/material.dart';

import 'common_colors.dart';

class CustomSnackBar {
  /// General custom snackbar
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Color textColor = Colors.white,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: 20),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? CommonColors.primaryColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        action: action,
      ),
    );
  }

  /// Success snackbar (Green)
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message,
      backgroundColor: CommonColors.successColor,
      icon: Icons.check_circle_rounded,
      duration: duration,
    );
  }

  /// Error snackbar (Red)
  static void showError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context,
      message,
      backgroundColor: CommonColors.errorColor,
      icon: Icons.error_outline_rounded,
      duration: duration,
    );
  }

  /// Warning / Primary snackbar (matches class style)
  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message,
      backgroundColor: CommonColors.primaryColor,
      icon: Icons.warning_amber_rounded,
      duration: duration,
    );
  }

  /// Info snackbar (Blue)
  static void showInfo(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message,
      backgroundColor: CommonColors.infoColor,
      icon: Icons.info_outline_rounded,
      duration: duration,
    );
  }
}

// Convenient top-level helper functions for direct calls
void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  IconData? icon,
}) {
  CustomSnackBar.show(
    context,
    message,
    backgroundColor: backgroundColor,
    icon: icon,
  );
}

void showSuccessSnackBar(BuildContext context, String message) {
  CustomSnackBar.showSuccess(context, message);
}

void showErrorSnackBar(BuildContext context, String message) {
  CustomSnackBar.showError(context, message);
}

void showWarningSnackBar(BuildContext context, String message) {
  CustomSnackBar.showWarning(context, message);
}
