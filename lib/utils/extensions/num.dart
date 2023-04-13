import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/general/manat_price.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';

extension NumExtension on num? {
  Widget toManat(
          {final double? textSize,
          final double? manatSize,
          final Color? mainColor,
          final Color? backColor,
          final double r = 0,
          final FontWeight? fontWeight,
          final bool stroked = true}) =>
      ManatPrice(
          price: this,
          textSize: textSize,
          mainColor: mainColor,
          manatSize: manatSize,
          backColor: backColor,
          r: r,
          fontWeight: fontWeight,
          stroked: stroked);

  Widget toManat13(
          {final double textSize = 13,
          final double manatSize = 13,
          final Color? mainColor,
          final Color? backColor,
          final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
          final MainAxisSize mainAxisSize = MainAxisSize.min,
          final String? title,
          final double r = 0,
          final FontWeight? fontWeight = FontWeight.w400,
          final bool stroked = true}) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          title.isNotNull
              ? Text(
                  '${title!}: ',
                  style: AppTextStyles.sfPro600.copyWith(
                      fontWeight: fontWeight,
                      fontSize: textSize,
                      color: mainColor),
                )
              : Container(),
          ManatPrice(
              price: this,
              textSize: textSize,
              mainColor: mainColor,
              manatSize: manatSize,
              backColor: backColor,
              r: r,
              fontWeight: fontWeight,
              stroked: stroked),
        ],
      );
}
