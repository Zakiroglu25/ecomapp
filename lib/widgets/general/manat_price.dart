// Flutter imports:
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sized_box.dart';

class ManatPrice extends StatelessWidget {
  final String price;
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
        children: [
          Text(
            price,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textSize ?? 16,
              fontFamily: 'sf',
              color: mainColor ?? MyColors.black,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
          ),
          MySizedBox.w5,
          Text(
            '₼',
            style: TextStyle(
                fontSize: manatSize ?? 16,
                fontFamily: 'sf',
                color: mainColor ?? MyColors.black,
                fontWeight: fontWeight ?? FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
