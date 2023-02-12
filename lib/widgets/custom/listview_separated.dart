import 'package:flutter/material.dart';

import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.padding = Paddings.paddingH16,
      this.shrinkWrap = false,
      this.physics,
      this.addAutomaticKeepAlives = true,
      this.separator,
      this.controller})
      : super(key: key);

  final EdgeInsets padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final bool addAutomaticKeepAlives;
  final Widget? separator;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: padding,
      physics: physics,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        return separator ?? MySizedBox.h16;
      },
    );
  }
}
