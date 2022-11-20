import 'package:flutter/material.dart';

import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';

class ListviewSeparated extends StatelessWidget {
  const ListviewSeparated(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.padding = Paddings.paddingH16,
      this.shrinkWrap = false,
      this.physics,
      this.separator})
      : super(key: key);

  final EdgeInsets padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Widget? separator;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      padding: padding,
      physics: physics,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        return separator ?? MySizedBox.h16;
      },
    );
  }
}
