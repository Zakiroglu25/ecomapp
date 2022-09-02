// Flutter imports:
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sized_box.dart';

class ManatPrice extends StatelessWidget {
  final String price;
  final double? textSize;
  final double? manatSize;
  final Color? mainColor;
  final Color? backColor;
  final FontWeight? fontWeight;
  final bool stroked;

  ManatPrice(
      {required this.price,
      this.textSize,
      this.manatSize,
      this.mainColor,
      this.backColor,
      this.stroked = true,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor ?? Colors.transparent,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            price,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textSize ?? 16,
              color: mainColor ?? MyColors.black0,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
          ),
          MySizedBox.w5,
          Text(
            '₼',
            style: TextStyle(
                fontSize: manatSize ?? 16,
                color: mainColor ?? MyColors.black0,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
