import 'package:flutter/widgets.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static const sfPro600 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static const sfPro700 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static const sfPro500 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const sfPro400 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static const sanF400 = TextStyle(
      fontFamily: 'San Francisco',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sanF400Grey = TextStyle(
      fontFamily: 'San Francisco',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: MyColors.grey153,
      letterSpacing: 0.3);

  static const sanF500 = TextStyle(
      fontFamily: 'San Francisco',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);
  static const sanF600 = TextStyle(
      fontFamily: 'San Francisco',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.3);

}
