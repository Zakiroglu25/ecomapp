import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/forgot_back_button.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/send_again_row.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

class OTPView extends StatelessWidget {
  const OTPView(
      {Key? key,
      required this.showBackButton,
      required this.button,
      required this.countdownTimeStream,
      required this.onTapResend,
      required this.pinField})
      : super(key: key);
  final bool showBackButton;
  final Widget pinField, button;
  final Stream<int> countdownTimeStream;
  final VoidCallback onTapResend;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        showBackButton ? const ForgotBackButton() : Container(),
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
            const Text(
              MyText.inputOtp,
              style: AppTextStyles.sfPro600,
            ),
            pinField,
            SendAgainRow(
              onTap: onTapResend,
              countdownTimeStream: countdownTimeStream,
            ),
            // const Text(
            //   MyText.otpInfo,
            //   style: AppTextStyles.sfPro600,
            // ),
          ],
        ),
        button,
      ],
    );
  }
}
