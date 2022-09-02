import 'package:flutter/material.dart';

import '../../utils/constants/sized_box.dart';

class ManatPriceLined extends StatelessWidget {
  final String price;
  final double? textSize;
  final double? manatSize;
  final Color? mainColor;
  final Color? backColor;
  final FontWeight? fontWeight;
  final bool stroked;

  ManatPriceLined(
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
      // color: Colors.red,
      // width: 69,

      child: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            //  color: Colors.cyanAccent,
            height: 22,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price ?? "00.00",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: fontWeight ?? FontWeight.w700,
                      color: mainColor,
                      fontSize: textSize ?? 16),
                ),
                MySizedBox.w8,
              ],
            ),
          ),
          Positioned(
            top: 1,
            right: 0,
            child: Text(
              '₼',
              style: TextStyle(fontSize: manatSize ?? 16),
            ),
          )
        ],
      ),
    );
  }
}
