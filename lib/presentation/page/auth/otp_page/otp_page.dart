import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/otp/index.dart';
import 'package:uikit/presentation/page/auth/otp_page/widgets/otp_login_button.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/custom/app_safe_area.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import '../../../../utils/constants/paddings.dart';
import '../../../../widgets/general/app_loading.dart';
import '../forgot_password_page/widget/forgot_back_button.dart';
import 'widgets/otp_pin_code_field.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key, required this.showBackButton}) : super(key: key);
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        body: BlocConsumer<OTPCubit, OtpState>(
          listener: (context, state) {
            if (state is OtpError)
              Snack.showOverlay(context: context, message: state.error);
          },
          builder: (context, state) {
            if (state is OtpInProgress) {
              return AppLoading();
            }
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
                    Text(
                      MyText.inputOtp,
                      style: AppTextStyles.sfPro500,
                    ),
                    OtpPinCodeField(),
                    //   SendAgainRow(),
                    Text(
                      MyText.otpInfo,
                      style: AppTextStyles.sfPro500,
                    ),
                  ],
                ),
                OtpLoginButton(
                  showLogOutButton: !showBackButton,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
