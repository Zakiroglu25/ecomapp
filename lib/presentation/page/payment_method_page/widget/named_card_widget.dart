import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../widgets/custom/app_button.dart';
import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';

class NamedAndSaveWidget extends StatelessWidget {
  const NamedAndSaveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: 'Ödəniş üsulu əlavə et',
        notification: false,
        addressDropdown: false,
        user: false,
        filter: false,
        contextA: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("KARTLAR",
                    style: AppTextStyles.sfPro400s14
                        .copyWith(color: MyColors.grey158)),
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyColors.grey245,
                  ),
                  child: Row(
                    children: [
                      MySizedBox.w16,
                      Image.asset(Assets.masterCard),
                      MySizedBox.w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "5117 76** **** 2993",
                            style: AppTextStyles.sfPro500
                                .copyWith(fontSize: 16.sp),
                          ),
                          Text(
                            "XXX kartim",
                            style: AppTextStyles.sfPro400s14
                                .copyWith(color: MyColors.grey158),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            MySizedBox.h16,
            AppField(
              title: "Karta ad verin *",
              hint: "XXX kartim",
            ),
            Spacer(),
            Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                child: AppButton(
                  onTap: () {},
                  text: "Əlavə et",
                ))
          ],
        ),
      ),
    );
  }
}
