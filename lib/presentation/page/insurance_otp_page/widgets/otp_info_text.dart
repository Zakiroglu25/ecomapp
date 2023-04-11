import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/text.dart';

class OtpInfoText extends StatelessWidget {
  const OtpInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      MyText.otpInfo,
      style: AppTextStyles.sfPro500,
    );
  }
}
