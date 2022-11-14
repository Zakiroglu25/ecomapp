import 'package:uikit/utils/constants/paddings.dart';
import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  const SpacedRow({
    Key? key,
    required this.children,
    this.padding = Paddings.zero,
    this.space,
    this.mainAxisSize = MainAxisSize.max,
    this.leftSpace = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    // this.verticalDirection,
    // this.textDirection,
    // this.textBaseline,
  }) : super(key: key);
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final bool leftSpace;
  final CrossAxisAlignment crossAxisAlignment;
  final double? space;
  final EdgeInsets padding;

  // final TextDirection? textDirection;
  // final VerticalDirection? verticalDirection;
  // final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: children
            .map<Widget>((e) => Padding(
                  padding: EdgeInsets.only(
                    right: !leftSpace ? (space ?? 0) : 0,
                    left: leftSpace ? (space ?? 0) : 0,
                  ),
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
