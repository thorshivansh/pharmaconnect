import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance

class CustomButtonStyles {
  // Outline button style
  static ButtonStyle get outlinePinkA => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer,
        side: BorderSide(
          color: appTheme.pinkA400,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
        padding: EdgeInsets.zero,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: Colors.transparent),
      ));
}
