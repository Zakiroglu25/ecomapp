import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/text_title_big.dart';
import '../../../../../widgets/general/doctoro_logo.dart';

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
      style: AppTextStyles.sfPro400s14
          .copyWith(fontSize: 14, color: MyColors.grey153),
      textAlign: TextAlign.left,
    );
  }
}
