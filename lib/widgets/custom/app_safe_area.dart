import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

class AppSafeArea extends StatelessWidget {
  final Widget child;
  final Color color;

  const AppSafeArea(
      {Key? key, required this.child, this.color = MyColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
