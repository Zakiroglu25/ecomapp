import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/text.dart';

class OtpInputOtpText extends StatelessWidget {
  const OtpInputOtpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      MyText.inputOtp,
      style: AppTextStyles.sfPro500,
    );
  }
}
