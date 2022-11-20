import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../infrastructure/cubit/otp/otp_cubit.dart';
import '../../../../../utils/constants/colors.dart';

class OtpPinCodeField extends StatelessWidget {
  const OtpPinCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        borderWidth: 0,
        fieldHeight: 48,
        fieldWidth: 48,
        activeColor: MyColors.black,
        selectedColor: MyColors.green,
        inactiveColor: MyColors.transparent,
        disabledColor: MyColors.transparent,
        selectedFillColor: MyColors.grey245,
        activeFillColor: MyColors.grey245,
        inactiveFillColor: MyColors.grey245,
      ),
      animationDuration: Duration(milliseconds: 300),
      //backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      //errorAnimationController: errorController,
      //  controller: textEditingController,
      onCompleted: (v) => context.read<OTPCubit>().validateOtp(context),
      onChanged: (value) => context.read<OTPCubit>().updateOtp(value),
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
