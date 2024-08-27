import 'package:flutter/material.dart';
import 'package:govbr_ds/theme/theme_colors.dart';

class AlertUtil {
  factory AlertUtil() => _instance;

  AlertUtil._();

  static final AlertUtil _instance = AlertUtil._();

  static void info(context, String message, bool? pop, {String? actionLabel}) {
    showSnackBar(
      context,
      SnackBar(
        elevation: 20,
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: ThemeColors.primary.shade100,
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          textColor: ThemeColors.primary.shade500,
          label: actionLabel ?? "Fechar",
          onPressed: () {
            if (pop != null && pop) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  static void warn(context, String message, {String? actionLabel}) {
    showSnackBar(
      context,
      SnackBar(
        elevation: 20,
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: ThemeColors.warnBackgroundColor,
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          textColor: ThemeColors.alertTextColor,
          label: actionLabel ?? "Fechar",
          onPressed: () {},
        ),
      ),
    );
  }

  static void error(context, dynamic message, {String? actionLabel}) {
    showSnackBar(
      context,
      SnackBar(
        elevation: 20,
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: const TextStyle(color: ThemeColors.errorTextColor)),
        backgroundColor: ThemeColors.errorBackgroundColor,
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          disabledTextColor: ThemeColors.errorTextColor,
          textColor: ThemeColors.errorTextColor,
          label: actionLabel ?? "Fechar",
          onPressed: () {},
        ),
      ),
    );
  }

  static void success(context, String message, bool? pop, {String? actionLabel}) {
    showSnackBar(
      context,
      SnackBar(
        elevation: 20,
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: const TextStyle(color: ThemeColors.success)),
        backgroundColor: ThemeColors.successBackgroundColor,
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          textColor: ThemeColors.success,
          label: actionLabel ?? "Fechar",
          onPressed: () {
            if (pop != null && pop) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  static void showSnackBar(context, SnackBar snackBar) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
