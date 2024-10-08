import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/delegate/pager.dart';

class AddInsurance extends StatelessWidget {
  const AddInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: MyColors.white),
            width: 311,
            height: 425.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Go.to(context, Pager.addInsuranceInfo);
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.black),
                    child: const Icon(
                      Icons.add,
                      color: MyColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 49.0, right: 49, top: 16),
                  child: Text("Daha bir sığorta əlavə et",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.sfPro700s24
                          .copyWith(color: MyColors.grey158)),
                )
              ],
            )),
      ],
    );
  }
}
