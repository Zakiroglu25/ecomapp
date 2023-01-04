import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';

import 'empty_widget.dart';

class ListOrEmpty extends StatelessWidget {
  final List<dynamic>? list;
  final Widget child;
  final Widget? elseChild;
  final String? text;
  final double? h;
  final String? image;
  final String? description;
  final Function? onRefresh;

  ListOrEmpty(
      {required this.list,
      required this.child,
      this.text,
      this.h,
      this.description,
      this.onRefresh,
      this.image,
      this.elseChild});

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: (list != null && list?.length != 0),
      child: child,
      elseChild: Center(
        child: EmptyWidget(
          elseChild: elseChild,
          imageUrl: image,
          onRefresh: onRefresh,
          h: h ?? MediaQuery.of(context).size.height / 2,
          text: text,
          description: description,
        ),
      ),
    );
  }
}
