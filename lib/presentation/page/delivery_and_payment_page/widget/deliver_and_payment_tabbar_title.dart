import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/sliver_app_bar_delegate.dart';

class DeliverAndPaymentTabbarTitle extends SliverAppDelegate {
  DeliverAndPaymentTabbarTitle({Key? key})
      : super(
            child: Padding(
              padding: Paddings.paddingH16 + Paddings.paddingV8,
              child: const Text(
                MyText.chooseDeliveryType,
                style: AppTextStyles.sfPro600s16,
              ),
            ),
            minExtent_: 0,
            maxExtent_: 36);
}
