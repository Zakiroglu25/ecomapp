// Flutter imports:
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/paddings.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sized_box.dart';

class ManatPrice extends StatelessWidget {
  final num? price;
  final double? textSize;
  final double? manatSize;
  final Color? mainColor;
  final Color? backColor;
  final double r;
  final FontWeight? fontWeight;
  final bool stroked;

  ManatPrice(
      {required this.price,
      this.textSize,
      this.manatSize,
      this.mainColor,
      this.r = 0,
      this.backColor,
      this.stroked = true,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          r != 0 ? (Paddings.paddingH12 + Paddings.paddingV4) : Paddings.zero,
      decoration: BoxDecoration(
          color: backColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(r)),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            price?.toStringAsFixed(2) ?? "0",
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.sfPro500.copyWith(
              fontSize: textSize ?? 16,
              // fontFamily: 'sf',
              color: mainColor ?? MyColors.black,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
          ),
          MySizedBox.w4,
          Text(
            '₼',
            style: TextStyle(
                fontSize: manatSize ?? 16,
                // fontFamily: 'sf',
                color: mainColor ?? MyColors.black,
                fontWeight: fontWeight ?? FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
