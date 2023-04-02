import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../general/empty_widget.dart';

class HalfEmptyWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Widget? elseChild;
  final Color? color;
  final double? h;
  final double? w;
  final String? imageUrl;
  final Function? onRefresh;

  const HalfEmptyWidget(
      {Key? key,
      this.text,
      this.description,
      this.elseChild,
      this.h,
      this.onRefresh,
      this.color,
      this.w,
      this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.8,
      child: EmptyWidget(
        imageUrl: imageUrl,
        color: color,
        text: text,
        h: h,
        w: w,
        onRefresh: onRefresh,
        elseChild: elseChild,
        description: description,
      ),
    );
  }
}
