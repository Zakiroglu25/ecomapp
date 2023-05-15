import 'package:flutter/widgets.dart';
import 'package:uikit/utils/constants/colors.dart';

abstract class AppTextStyles {
  static const sfPro700 = TextStyle(
      fontFamily: 'ProximaNova-Bold',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro700s24 = TextStyle(
      fontFamily: 'ProximaNova-Bold',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro700s30 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontSize: 30,
      color: MyColors.black,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro500 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro600 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro500s13 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontWeight: FontWeight.w500,
      fontSize: 13,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sfPro400s12 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro400s14 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro400s16 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  // static const sfPro600 = TextStyle(
  //     fontFamily: 'ProximaNova-SemiBold',
  //     fontWeight: FontWeight.w600,
  //     fontStyle: FontStyle.normal,
  //     letterSpacing: 0.3);
  static const sfPro600s16 = TextStyle(
      fontFamily: 'ProximaNova-SemiBold',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      letterSpacing: 0.3);
  static const sfPro600s24 = TextStyle(
      fontFamily: 'ProximaNova-SemiBold',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro600s30 = TextStyle(
      fontFamily: 'ProximaNova-SemiBold',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

  static const sfPro400h2 = TextStyle(
      fontFamily: 'ProximaNova-Regular',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.8,
      letterSpacing: 0.3);
}
