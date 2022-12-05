import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';

class AppLinearLoading extends StatelessWidget {
  const AppLinearLoading(
      {Key? key, this.color = MyColors.brand, this.w = 93, this.h = 4})
      : super(key: key);
  final Color color;
  final double? h;
  final double? w;

  const AppLinearLoading.green(
      {Key? key, this.color = MyColors.green, this.h = 4, this.w})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      margin: Paddings.paddingV5,
      width: w,
      child: LinearProgressIndicator(
        color: color,
        backgroundColor: MyColors.mainOpacityDark,
      ),
    );
  }
}
