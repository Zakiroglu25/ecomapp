import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../infrastructure/cubit/insurance_otp_cubit/insurance_otp_cubit.dart';

class OtpPinCodeField extends StatelessWidget {
  const OtpPinCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InsuranceOtpCubit>();
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.phone,
      animationType: AnimationType.fade,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        borderWidth: 0,
        fieldHeight: 48,
        fieldWidth: 48,
        activeColor: MyColors.black,
        selectedColor: MyColors.green85,
        inactiveColor: MyColors.transparent,
        disabledColor: MyColors.transparent,
        selectedFillColor: MyColors.grey245,
        activeFillColor: MyColors.grey245,
        inactiveFillColor: MyColors.grey245,
      ),
      animationDuration: const Duration(milliseconds: 300),
      //backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      //errorAnimationController: errorController,
      focusNode: cubit.otpFocus,
      controller: cubit.otpController,
      onCompleted: (v) => cubit.validateInsurance(context),
      onChanged: (value) => cubit.updateOtp(value),
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
