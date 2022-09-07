import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/paddings.dart';

class ProductAndOtherWidget extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final String? title;
  final String? desc;
  final String? imageUrl;
  final double? w;
  final double? h;

  ProductAndOtherWidget(
      {Key? key,
      this.color,
      this.title,
      this.desc,
      this.imageUrl,
      this.w,
      this.h,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Container(
        padding: Paddings.paddingA20,
        width: w,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 56, height: 56, child: Image.asset(imageUrl!)),
            MySizedBox.h4,
            Text(
              title!,
              style: AppTextStyles.sfPro600
                  .copyWith(color: MyColors.black34, fontSize: 16.sp),
            ),
            MySizedBox.h4,
            Text(
              desc!,
              style: AppTextStyles.sfPro400s14
                  .copyWith(color: MyColors.black34, fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }
}
