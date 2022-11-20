import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/otp/otp_cubit.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';

class OtpLoginButton extends StatelessWidget {
  const OtpLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: AppButton(
        isButtonActive: !context.watch<OTPCubit>().isOtpIncorrect,
        text: MyText.login,
        onTap: () => context.read<OTPCubit>().validateOtp(context),
      ),
    );
  }
}
