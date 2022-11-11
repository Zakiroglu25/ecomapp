import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';

//
// class AppBarActionItem extends StatelessWidget {
// //   const AppBarActionItem({Key key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }

class AppBarActionItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget? child;

  const AppBarActionItem({Key? key, required this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: 53,
        height: 43,
        padding: EdgeInsets.only(right: 10, left: 10, top: 2),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
