import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';

import '../../../../utils/constants/paddings.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: Paddings.paddingV50 + Paddings.paddingH16,
        children: [
          Text(
            "OTP",
            style: AppTextStyles.sfPro600s16,
          )
        ],
      ),
    );
  }
}
