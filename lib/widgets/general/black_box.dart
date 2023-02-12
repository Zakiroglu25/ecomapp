import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/paddings.dart';

import '../../utils/constants/colors.dart';

class BlackBox extends StatelessWidget {
  final double? textSize;
  final Color mainColor;
  final Color backColor;
  final double r;
  final String text;
  final FontWeight? fontWeight;

  const BlackBox(this.text,
      {super.key,
      this.textSize,
      this.mainColor = MyColors.white,
      this.r = 24,
      this.backColor = MyColors.black,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          r != 0 ? (Paddings.paddingH12 + Paddings.paddingV4) : Paddings.zero,
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(r)),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: textSize ?? 13,
          fontFamily: 'sf',
          color: mainColor,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}
