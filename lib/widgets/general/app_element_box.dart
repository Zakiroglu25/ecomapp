import 'package:flutter/material.dart';

import '../../utils/constants/border_radius.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';

class AppElementBox extends StatelessWidget {
  const AppElementBox(
      {Key? key,
      required this.child,
      this.color = MyColors.grey245,
      this.onTap})
      : super(key: key);
  final Widget child;
  final Color color;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Paddings.paddingA12,
        child: child,
        decoration: BoxDecoration(color: color, borderRadius: Radiuses.r12),
      ),
    );
  }
}
