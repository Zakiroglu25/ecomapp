import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/app_text_styles.dart';

class CashPaymentBox extends StatelessWidget {
  const CashPaymentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16 + Paddings.paddingV5,
      //   padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.asset(Assets.pngCash),
          ),
          MySizedBox.w12,
          Text(
            MyText.cashPayment,
            style: AppTextStyles.sfPro600,
          ),
        ],
      ),
    );
  }
}
