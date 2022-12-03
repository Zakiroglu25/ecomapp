import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/authentication/authentication_cubit.dart';
import 'package:uikit/infrastructure/cubit/otp/otp_cubit.dart';

import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';

class OtpLoginButton extends StatelessWidget {
  const OtpLoginButton({Key? key, this.showLogOutButton = false})
      : super(key: key);
  final bool showLogOutButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: Column(
        children: [
          AppButton(
            isButtonActive: !context.watch<OTPCubit>().isOtpIncorrect,
            text: MyText.login,
            onTap: () => context.read<OTPCubit>().validateOtp(context),
          ),
          MySizedBox.h16,
          showLogOutButton
              ? AppButton(
                  text: MyText.logout,
                  onTap: () =>
                      context.read<AuthenticationCubit>().logOut(context),
                )
              : Container(),
        ],
      ),
    );
  }
}
