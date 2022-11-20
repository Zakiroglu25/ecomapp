import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/auth/otp_page/widgets/login_button.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import '../../../../../utils/constants/paddings.dart';
import '../../forgot_password_page/widget/forgot_back_button.dart';
import 'otp_info_text.dart';
import 'otp_input_otp_text.dart';
import 'otp_pin_code_field.dart';

class OtpBuildGeneralBody extends StatelessWidget {
  const OtpBuildGeneralBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ForgotBackButton(),
        SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          space: 16,
          padding: Paddings.paddingV50 + Paddings.paddingH16,
          children: [
            MySizedBox.h8,
            Text(
              MyText.otp,
              style: AppTextStyles.sfPro700.copyWith(fontSize: 30),
            ),
            MySizedBox.zero,
            const OtpInputOtpText(),
            const OtpPinCodeField(),
            //   SendAgainRow(),
            const OtpInfoText(),
          ],
        ),
        const LoginButton(),
      ],
    );
  }
}
