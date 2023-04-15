import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/authentication/authentication_cubit.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/infrastructure/cubit/otp/otp_cubit.dart';

import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';
import '../../../../infrastructure/cubit/insurance_otp_cubit/insurance_otp_cubit.dart';

class InsuranceOtpButton extends StatelessWidget {
  const InsuranceOtpButton({Key? key, this.showLogOutButton = false})
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
            isButtonActive: !context.watch<InsuranceOtpCubit>().isOtpIncorrect,
            text: MyText.confirm,
            onTap: () =>
                context.read<InsuranceOtpCubit>().validateInsurance(context),
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
