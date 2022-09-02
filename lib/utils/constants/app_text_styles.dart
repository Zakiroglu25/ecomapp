import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  static const sfPro600 = TextStyle(
      fontFamily: 'SF Pro Display Semibold',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro700 = TextStyle(
      fontFamily: 'SF Pro Display Semibold',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro500 = TextStyle(
      fontFamily: 'SF Pro Display Semibold',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro400 = TextStyle(
      fontFamily: 'sf',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro400H2 = TextStyle(
      fontFamily: 'sf',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 2,
      letterSpacing: 0.3);
}
