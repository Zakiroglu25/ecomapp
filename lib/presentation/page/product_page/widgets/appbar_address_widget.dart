import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';

class AppBarAddressWidget extends StatelessWidget {
  const AppBarAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 60,
      right: 90,
      child: Container(
        padding: Paddings.paddingH16,
        width: 224.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: MyColors.green235,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on_sharp,
              color: MyColors.green,
            ),
            MySizedBox.w12,
            Flexible(
              child: Text(
                "Qara Qarayev ev 4 Menzil 35 ve ne bilim ne",
                style: AppTextStyles.sfPro400s14
                    .copyWith(color: MyColors.green85),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: MyColors.green,
            )
          ],
        ),
      ),
    );
  }
}
