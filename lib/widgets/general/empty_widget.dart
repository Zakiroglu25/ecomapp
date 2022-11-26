import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Widget? elseChild;
  final Color? color;
  final double? h;
  final double? w;
  final String? imageUrl;

  EmptyWidget(
      {this.text,
      this.description,
      this.elseChild,
      this.h,
      this.color,
      this.w,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetOrEmpty(
          value: imageUrl != null,
          child: Container(
            width: 167,
            height: 167,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
                width: 127.w,
                height: 127.h,
                child: Image.asset(imageUrl ?? Assets.pngHeart)),
          ),
        ),
        MySizedBox.h16,
        Text(text ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyles.sfPro700
                .copyWith(fontSize: 24, color: MyColors.grey158)),
        MySizedBox.h10,
        Padding(
          padding: Paddings.paddingH40,
          child: Text(
            description ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyles.sfPro400s16
                .copyWith(fontSize: 16, color: MyColors.grey158),
          ),
        ),
      ],
    );
  }
}
