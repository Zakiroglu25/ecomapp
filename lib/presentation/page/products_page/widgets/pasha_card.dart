import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';

class PashaCardWidget extends StatelessWidget {
  const PashaCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Go.to(context, Pager.pashaInsurance),
      child: Container(
        height: 84,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: MyColors.blue0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              MyText.pashaTitleProduct,
              style: AppTextStyles.sfPro600
                  .copyWith(color: MyColors.blue01, fontSize: 16.sp),
            ),
            Image.asset(Assets.pasha)
          ],
        ),
      ),
    );
  }
}
