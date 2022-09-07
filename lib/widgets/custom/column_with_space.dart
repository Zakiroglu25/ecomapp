import 'package:flutter/material.dart';

import '../../utils/constants/paddings.dart';

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({
    Key? key,
    required this.children,
    this.space,
    this.mainAxisSize = MainAxisSize.min,
    this.padding = Paddings.zero,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    // this.verticalDirection,
    // this.textDirection,
    // this.textBaseline,
  }) : super(key: key);
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;
  final double? space;

  // final TextDirection? textDirection;
  // final VerticalDirection? verticalDirection;
  // final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: children
            .map<Widget>((e) => Padding(
                  padding: EdgeInsets.only(bottom: space ?? 0),
                  child: e,
                ))
            .toList(),
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        // textBaseline: textBaseline,
        // textDirection: textDirection,
        // verticalDirection: verticalDirection
      ),
    );
  }
}
