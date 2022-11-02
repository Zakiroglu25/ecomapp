import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'widget/add_bank_kart.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      onBack: () => Go.pop(context),
      notification: false,
      user: false,
      title: 'Ödəniş üsulları',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KARTLAR",
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.grey158),
                ),
                MySizedBox.h4,
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.grey245,
                    ),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            MySizedBox.h16,
                            Row(
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
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    )),
              ],
            ),
          ),
          MySizedBox.h32,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              onTap: () {
                Go.to(context, AddBankCard());
              },
              text: "+ Ödəniş üsulu əlavə et",
            ),
          )
        ],
      ),
    );
  }
}
