import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/screen/widget_or_empty.dart';

class SectionName extends StatelessWidget {
  String? title;
  double? hP;
  double? vP;
  double? size;
  Widget? tile;
  int? maxLines;

  SectionName(
      {required this.title,
      this.vP,
      this.hP,
      this.size,
      this.tile,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: hP ?? 0, vertical: vP ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title!,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
              style: AppTextStyles.sfPro600s16.copyWith(
                  fontSize: size ?? 16,
                  letterSpacing: 0.3,
                  color: MyColors.grey153),
            ),
          ),
          WidgetOrEmpty(
            value: tile != null,
            child: tile,
          )
        ],
      ),
    );
  }
}
