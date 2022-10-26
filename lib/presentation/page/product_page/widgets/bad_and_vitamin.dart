import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/product_and_other_widget.dart';

class BadAndVitamin extends StatelessWidget {
  const BadAndVitamin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductAndOtherWidget(
          color: MyColors.green235,
          h: 167.h,
          w: 167.w,
          imageUrl: Assets.pngBad,
          title: MyText.bad,
          desc: MyText.badSub,
        ),
        ProductAndOtherWidget(
          color: MyColors.orange253,
          h: 167.h,
          w: 167.w,
          imageUrl: Assets.pngVitamin3x,
          title: MyText.vitamin,
          desc: MyText.vitaminSub,
        ),
      ],
    );
  }
}
