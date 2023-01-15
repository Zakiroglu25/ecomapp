import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_and_payment_phone_field.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/small_section.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';

class StaticDeliveryWidget extends StatelessWidget {
  const StaticDeliveryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallSection(
          title: MyText.delivery,
        ),
        MySizedBox.h4,
        Container(
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: MyColors.grey245),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "1-3 saat ərzində",
                  style: AppTextStyles.sfPro400s16,
                ),
              )),
        ),
        MySizedBox.h16,
        const DeliveryAndPaymentPhoneField(),
      ],
    );
  }
}
