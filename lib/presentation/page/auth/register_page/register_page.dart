import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/presentation/page/auth/register_page/widgets/create_password_field.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../utils/constants/paddings.dart';
import 'widgets/checkbox_ads.dart';
import 'widgets/email_field_register.dart';
import 'widgets/name_field_register.dart';
import 'widgets/phone_field_register.dart';
import 'widgets/policy_chechkbox_text.dart';
import 'widgets/register_button.dart';
import 'widgets/surname_field_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.black),
        backgroundColor: MyColors.white,
        elevation: 0,
        title: Text(
          MyText.register,
          style: AppTextStyles.sfPro600
              .copyWith(color: MyColors.black, fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (context, state) {
          if (state is RegisterButtonActive) {
            return false;
          } else {
            return true;
          }
        },
        listener: (context, state) {
          // if (state is RegisterFailed) {
          //   Snack.showOverlay(message: state.message ?? MyText.error);
          // }
        },
        child: Padding(
          padding: Paddings.paddingA16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySizedBox.h16,
                NameFieldRegister(),
                SurNameFieldRegister(),
                PhoneFieldRegister(),
                EmailFieldRegister(),
                MainPassFieldRegister(),
                MySizedBox.h26,
                const PolicyCheckbox(),
                //MySizedBox.h20,
                const AdsCheckbox(),
                MySizedBox.h50,
                const RegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
