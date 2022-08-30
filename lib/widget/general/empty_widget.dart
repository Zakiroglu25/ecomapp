import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/assets.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/paddings.dart';
import '../../util/constants/sized_box.dart';
import '../../util/constants/text.dart';
import '../../util/screen/widget_or_empty.dart';

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
        Container(
          width: 167,
          height: 167,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(imageUrl!),
        ),
        MySizedBox.h16,
        Text(text!,
            style: AppTextStyles.sfPro700
                .copyWith(fontSize: 24, color: MyColors.grey158)),
        MySizedBox.h10,
        Padding(
          padding: Paddings.paddingH40,
          child: Text(
            description!,
            textAlign: TextAlign.center,
            style: AppTextStyles.sfPro400
                .copyWith(fontSize: 16, color: MyColors.grey158),
          ),
        ),
      ],
    );
  }
}
