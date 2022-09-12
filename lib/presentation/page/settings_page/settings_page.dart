import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      onBack: () => Go.pop(context),
      notification: false,
      user: false,
      title: 'Tənzimləmələr',
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nömrəniz",
                style:
                    AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
              ),
              MySizedBox.h4,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.grey245,
                ),
                child: Column(
                  children: [
                    MySizedBox.h16,
                    Row(
                      children: [
                        MySizedBox.w16,
                        SvgPicture.asset(Assets.svgCallDark),
                        MySizedBox.w16,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+994 50 805 05 20",
                              style: AppTextStyles.sfPro500
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              "Mövcud nömrəniz",
                              style: AppTextStyles.sfPro400s14
                                  .copyWith(color: MyColors.grey158),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(Assets.svgEdit),
                        MySizedBox.w16,
                      ],
                    ),
                    MySizedBox.h16,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
