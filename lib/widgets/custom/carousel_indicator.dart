// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/screen/widget_or_empty.dart';

class CarouselIndicator extends StatelessWidget {
  final int imageNumber;
  final int currentImageIndex;
  final bool withAnimation;

  const CarouselIndicator(
      {Key? key,
      required this.imageNumber,
      required this.currentImageIndex,
      this.withAnimation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sW = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imageNumber; i++)
          //      imgList.indexOf(item)
          currentImageIndex == i
              ? WidgetOrEmpty(
                  value: withAnimation,
                  child: FlipInY(
                    //from: 10,
                    child: currentTick(sW),
                  ),
                  elseChild: currentTick(sW),
                )
              : Container(
                  margin: EdgeInsets.all(5),
                  width: sW / (imageNumber * 3.5) > 8
                      ? 8
                      : sW / (imageNumber * 3.5),
                  height: sW / (imageNumber * 3.5) > 8
                      ? 8
                      : sW / (imageNumber * 3.5),
                  decoration: BoxDecoration(
                      color: MyColors.halfGrey,
                      borderRadius: BorderRadius.circular(5)),
                ),
      ],
    );
  }

  Container currentTick(double sW) {
    return Container(
      margin: Paddings.paddingA4,
      width: sW / (imageNumber * 1.75) > 16 ? 16 : sW / (imageNumber * 1.75),
      height: sW / (imageNumber * 3.5) > 8 ? 8 : sW / (imageNumber * 3.5),
      decoration: BoxDecoration(
          color: MyColors.main, borderRadius: BorderRadius.circular(5)),
    );
  }
}
