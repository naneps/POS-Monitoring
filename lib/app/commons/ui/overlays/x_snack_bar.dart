import 'package:flutter/material.dart';
import 'package:mvvm_getx_pattern/app/commons/theme_manager.dart';

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

class XSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: type.textColor,
          ),
        ),
        backgroundColor: type.backgroundColor,
      ),
    );
  }
}

extension SnackBarTypeExtension on SnackBarType {
  Color get backgroundColor {
    switch (this) {
      case SnackBarType.success:
        return ThemeManager().successColor;
      case SnackBarType.error:
        return ThemeManager().errorColor;
      case SnackBarType.warning:
        return ThemeManager().warningColor;
      case SnackBarType.info:
        return ThemeManager().infoColor;
    }
  }

  Color get color {
    switch (this) {
      case SnackBarType.success:
        return ThemeManager().successColor;
      case SnackBarType.error:
        return ThemeManager().errorColor;
      case SnackBarType.warning:
        return ThemeManager().warningColor;
      case SnackBarType.info:
        return ThemeManager().infoColor;
    }
  }

  Color get textColor {
    switch (this) {
      case SnackBarType.success:
        return ThemeManager().textColor;
      case SnackBarType.error:
        return Colors.white;
      case SnackBarType.warning:
        return ThemeManager().textColor;
      case SnackBarType.info:
        return ThemeManager().textColor;
    }
  }
}
