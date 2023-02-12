import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/durations.dart';
import '../../../../utils/constants/paddings.dart';

class MainAddressBox extends StatelessWidget {
  const MainAddressBox({Key? key, required this.child, this.color})
      : super(key: key);
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.ms100,
      margin: Paddings.paddingH20,
      padding: Paddings.paddingH16 + Paddings.paddingV10,
      // width: 224.w,
      // height: 44.h,
      decoration: BoxDecoration(
        color: color ?? MyColors.green235,
        borderRadius: BorderRadius.circular(36),
      ),
      child: child,
    );
  }
}
