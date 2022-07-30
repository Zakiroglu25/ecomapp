import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/constants/app_text_styles.dart';
import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/sized_box.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../widget/custom/text_title_big.dart';
import '../../../../../widget/general/doctoro_logo.dart';

class LoginHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctoroLogo(),
        MySizedBox.h14,
        BigSection(
          title: MyText.enter,
        ),
        MySizedBox.h20,
        buildLittleText(),
      ],
    );
  }

  Text buildEnterText() {
    return Text(
      MyText.enter,
      style: AppTextStyles.sfPro600.copyWith(fontSize: 30.sp),
    );
  }

  Text buildLittleText() {
    return Text(
      MyText.enterText,
      style:
          AppTextStyles.sfPro400.copyWith(fontSize: 14, color: MyColors.grey153),
      textAlign: TextAlign.left,
    );
  }
}
