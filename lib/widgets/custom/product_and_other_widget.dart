import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

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
        //height: 167,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 56.w, height: 56.h, child: Image.asset(imageUrl!)),
            MySizedBox.h4,
            Text(
              title!,
              style: AppTextStyles.sfPro600s16
                  .copyWith(color: MyColors.black34),
            ),
            MySizedBox.h4,
            SizedBox(
              height: 55.h,
              child: Text(
                desc!,
                style: AppTextStyles.sfPro400s12
                    .copyWith(color: MyColors.black34, fontSize: 13.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
