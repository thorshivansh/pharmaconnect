import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/size_utils.dart';
import 'package:pharmaconnect/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber100,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange50,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow100,
      );
  static BoxDecoration get fillYellow10001 => BoxDecoration(
        color: appTheme.yellow10001,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red100,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue50,
      );
  static BoxDecoration get fillLightblue100 => BoxDecoration(
        color: appTheme.lightBlue100,
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA100,
      );
  static BoxDecoration get fillGreenA10001 => BoxDecoration(
        color: appTheme.greenA10001,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green50,
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

// Gradient decorations
  static BoxDecoration get gradientTealCToTealC => BoxDecoration(
        color: appTheme.teal300.withOpacity(0.1),
      );
  static BoxDecoration get gradientTealToTeal => BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.5, 0),
            end: const Alignment(0.5, 1),
            colors: [appTheme.teal300, appTheme.teal600],
          ),
          boxShadow: [
            BoxShadow(color: appTheme.teal300),
            BoxShadow(color: appTheme.teal600)
          ]);
// Outline decorations

  static BoxDecoration get outline => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.3),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(1, 0),
          ),
        ],
      );

  static BoxDecoration get outlineBlue => BoxDecoration(
      color: appTheme.lightBlue5001,
      border: Border.all(
        width: 1.h,
        color: appTheme.blue500,
      ));

  static BoxDecoration get outlineBlueGray => BoxDecoration(
      color: appTheme.teal50,
      border: Border.all(
        // color: appTheme.blueGray10001,
        width: 1.h,
      ));

  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray40001,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray10002 => BoxDecoration(
      color: theme.colorScheme.onErrorContainer,
      border: Border.all(
        color: appTheme.gray10002,
        width: 0.5.h,
      ));

  static BoxDecoration get outlineRedA => BoxDecoration(
          // color: const Color(0x0010676e),
          border: Border.all(
        color: Colors.transparent,
        // color: appTheme.redA700,
        width: 1.h,
      ));
}

// Circle borders
class BorderRadiusStyle {
  static BorderRadius get customBorderBL14 => BorderRadius.only(
        bottomLeft: Radius.circular(14.h),
        bottomRight: Radius.circular(14.h),
      );
  static BorderRadius get customBorderBL20 => BorderRadius.only(
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
      );
  static BorderRadius get customBorderLR8 => BorderRadius.horizontal(
        right: Radius.circular(8.h),
      );
  static BorderRadius get customBorderTL38 => BorderRadius.only(
        topRight: Radius.circular(38.h),
        bottomLeft: Radius.circular(38.h),
      );
  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );
}
