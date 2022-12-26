import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';

class SlidableWidget extends StatelessWidget {
  String? insuranceIcon;
  String? title;
  String? subTitle;
  int? status;

  SlidableWidget({this.insuranceIcon, this.title, this.subTitle, this.status});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.20,
        motion: ScrollMotion(),
        children: [
          SizedBox(
            width: 55,
            height: 48,
            child: Center(
              child: SlidableAction(
                onPressed: doNothing,
                backgroundColor: MyColors.darkRED,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: Paddings.paddingH16 + Paddings.paddingV12,
        child: Container(
          padding: Paddings.paddingH16 + Paddings.paddingV16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MyColors.grey245,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.pasha),
              MySizedBox.w16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: AppTextStyles.sfPro600s16,
                  ),
                  MySizedBox.h4,
                  SizedBox(
                    width: 158.w,
                    child: Text("$subTitle", style: AppTextStyles.sfPro400s14),
                  ),
                ],
              ),
              Spacer(),
              if (status == 1)
                Container(
                  width: 82.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: MyColors.mainGreen85,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                      child: Text("Aktivdir",
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.white))),
                ),
              if (status == 2)
                Container(
                  width: 82.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: MyColors.orange242,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                      child: Text("Yoxlanılır",
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.white))),
                ),
              if (status == 3)
                Container(
                  width: 82.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: MyColors.darkRED,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                      child: Text("Tapılmadı",
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.white))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
