import 'package:doctoro/presentation/page/auth/register_page/widgets/create_password_field.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/widgets/custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../utils/screen/snack.dart';
import 'widgets/checkbox_ads.dart';
import 'widgets/email_field_register.dart';
import 'widgets/phone_field_register.dart';
import 'widgets/policy_checkbox.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.black),
        backgroundColor: MyColors.white,
        elevation: 0,
        title: Text(
          "Hesab yarat",
          style: AppTextStyles.sfPro500
              .copyWith(color: MyColors.black, fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (contet, state) {
          if (state is RegisterButtonActive)
            return false;
          else
            return true;
        },
        listener: (context, state) {
          if (state is RegisterFailed) {
            Snack.display(context: context, message: state.message!.toString());
            // TODO: implement listener
          }
          if (state is RegisterSuccess) {
            Snack.display(
                context: context,
                message: "Oldu Reis",
                positive: true,
                showSuccessIcon: true);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySizedBox.h16,
                PhoneFieldRegister(),
                EmailFieldRegister(),
                MainPassFieldRegister(),
                MySizedBox.h26,
                PolicyCheckbox(),
                MySizedBox.h20,
                AdsCheckbox(),
                MySizedBox.h50,
                StreamBuilder<bool>(
                    stream: BlocProvider.of<RegisterCubit>(context)
                        .registerActiveeStream,
                    builder: (context, snapshot) {
                      return AppButton(
                        // isButtonActive: snapshot.data,
                        loading: (context.watch<RegisterCubit>().state
                            is RegisterLoading),
                        onTap: () =>
                            context.read<RegisterCubit>().register(context),
                        child: Text(
                          "Davam et",
                          style: AppTextStyles.sfPro500
                              .copyWith(color: MyColors.white, fontSize: 15.sp),
                        ),
                        color: MyColors.grey288,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
