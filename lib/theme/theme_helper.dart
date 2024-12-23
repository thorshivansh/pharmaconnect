import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/size_utils.dart';

import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils.getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };
// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    PrefUtils.setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.black900,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 4,
        space: 4,
        color: appTheme.gray900,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.blueGray500,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray700,
          fontSize: 11.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color scheme.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF10676E),
    primaryContainer: Color(0XFF171414),
    secondaryContainer: Color(0XFF595959),
    errorContainer: Color(0XFF344053),
    onError: Color(0XFF656B72),
    onErrorContainer: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF0D0D0D),
    onPrimaryContainer: Color(0XFF2B9794),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Blue
  Color get blue500 => const Color(0XFF1890FF);
  Color get blue300 => const Color(0XFF62B4FF);
  Color get blue100 => const Color(0XFFC5E2FC);
  // Black
  Color get black900 => const Color(0XFF000000);
  //Amber
  Color get amber100 => const Color(0XFFFFE8A6);
  // BlueGray
  Color get blueGray70001 => const Color(0XFF475466);
  Color get blueGray700 => const Color(0XFF535658);
  Color get blueGray500 => const Color(0XFF667084);
  Color get blueGray50 => const Color(0XFFEAECF0);
  Color get blueGray300 => const Color(0XFFA1A5B7);
  Color get blueGray10001 => const Color(0XFFC9E8EA);
  Color get blueGray100 => const Color(0XFFD9D9D9);
  // DeepOrange
  Color get deepOrange50 => const Color(0XFFFFE9E9);
  // Cyan
  Color get cyan800 => const Color(0XFF14818A);
//Grey
  Color get gray10001 => const Color(0XFFF4F4F4);
  Color get gray10002 => const Color(0XFFF3F3F3);
  Color get gray100 => const Color(0XFFF5F4F4);
  Color get gray200 => const Color(0XFFEAEAEA);
  Color get gray400 => const Color(0XFFBEBEBE);
  Color get gray40001 => const Color(0XFFB8B8B8);
  Color get gray50 => const Color(0XFFFAFAFA);
  Color get gray500 => const Color(0XFF90979C);
  Color get gray5001 => const Color(0XFFF5FEFF);
  Color get gray800 => const Color(0XFF413E3E);
  Color get gray80001 => const Color(0XFF3B3636);
  Color get gray80002 => const Color(0XFF41464B);
  Color get gray900 => const Color(0XFF202124);
  Color get gray90001 => const Color(0XFF1E1818);
  Color get gray90002 => const Color(0XFF1C1B1F);
  Color get gray90003 => const Color(0XFF292524);
  // Green
  Color get green50 => const Color(0XFFD9F6DE);
  Color get greenA100 => const Color(0XFFADEDB9);
  Color get greenA10001 => const Color(0XFFAEEDB9);
  // LightBlue
  Color get lightBlue100 => const Color(0XFFA9EBFF);
  Color get lightBlue50 => const Color(0XFFD8F6FF);
  Color get lightBlue5001 => const Color(0XFFD7ECFF);

  // Pink
  Color get pink500 => const Color(0XFFE63051);
  Color get pinkA400 => const Color(0XFFFF004C);
  // Red
  Color get red100 => const Color(0XFFFFD3D3);
  Color get redA700 => const Color(0XFFFF0105);
  //Teal
  Color get teal300 => const Color(0XFF39ADA9);
  Color get teal3004c => const Color(0X4C39ACA8);
  Color get teal50 => const Color(0XFFCCEEF1);
  Color get teal600 => const Color(0XFF1E8380);
  Color get teal6004c => const Color(0X4C238683);
  // Yellow
  Color get yellow100 => const Color(0XFFFFF2D0);
  Color get yellow10001 => const Color(0XFFFFF3D0);
}
