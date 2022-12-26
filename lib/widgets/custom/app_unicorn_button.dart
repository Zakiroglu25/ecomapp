import 'package:flutter/material.dart';

import '../../utils/constants/border_radius.dart';
import '../../utils/constants/gradients.dart';
import '../../utils/constants/paddings.dart';
import '../general/colorfull_bordered.dart';

class AppUnicornButton extends StatelessWidget {
  const AppUnicornButton(
      {Key? key, required this.child, this.onPressed, this.padding})
      : super(key: key);
  final Widget child;
  final Function? onPressed;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      onPressed: () => onPressed?.call(),
      gradient: Gradients.gBack,
      strokeWidth: 1,
      padding: Paddings.paddingA1,
      radius: 99,
      child: Container(
        padding: padding ?? Paddings.paddingH12,
        child: Center(child: child),
        decoration: BoxDecoration(
            borderRadius: Radiuses.r99, gradient: Gradients.gBorder),
      ),
    );
  }
}
