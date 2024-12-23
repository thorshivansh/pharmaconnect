import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/size_utils.dart';
import 'package:pharmaconnect/theme/theme_helper.dart';

extension on TextStyle {
  TextStyle get helveticaNeue {
    return copyWith(
      fontFamily: 'Helvetica Neue',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
///  Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text
///
class CustomTextStyles {
  // Body text style
  static TextStyle get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get bodySmallGreen900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.greenA10001,
      );

  static TextStyle get bodySmallBlack90012 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );

  static TextStyle get bodySmallBlack9008 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 8.fSize,
      );
  static TextStyle get bodySmallBluegray300 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray300,
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallGray90001 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90001,
      );
  static TextStyle get bodySmallOnPrimary =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 9.fSize,
      );
  static TextStyle get bodySmallSecondaryContainer =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 10.fSize,
      );

  // Label text style
  static TextStyle get labelLargeGray80002 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80002,
        fontSize: 13.fSize,
      );
  static TextStyle get labelLargeGray90003 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90003,
        fontSize: 13.fSize,
      );
  static TextStyle get labelLargeOnPrimaryContainerSemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMediumBlue500 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blue500,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMediumCyan800 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.cyan800,
        fontSize: 11.fSize,
      );
  static TextStyle get labelMediumCyan500 =>
      theme.textTheme.labelMedium!.copyWith(
          color: appTheme.cyan800,
          fontSize: 11.fSize,
          fontWeight: FontWeight.w500);
  static TextStyle get labelMediumOnError =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onError,
      );
  static TextStyle get labelMediumPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static TextStyle get labelMediumSemiBold =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 16.fSize,
      color: Colors.white);
  static TextStyle get labeNavBold => theme.textTheme.labelMedium!.copyWith(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12.fSize,
      color: Colors.white);

//Title text style
  static TextStyle get titleMediumBlack900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleMediumBluegray70001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumHelveticaNeue =>
      theme.textTheme.titleMedium!.helveticaNeue.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumHelveticaNeueBold =>
      theme.textTheme.titleMedium!.helveticaNeue.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumHelveticaNeueMedium =>
      theme.textTheme.titleMedium!.helveticaNeue.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallBlack900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallGray80001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray80001,
      );
  static TextStyle get titleSmallOnErrorContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
}
