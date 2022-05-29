import 'package:doctoro/presantation/page/auth/register_page/widgets/create_password_field.dart';
import 'package:doctoro/util/constants/app_text_styles.dart';
import 'package:doctoro/util/constants/colors.dart';
import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/formatter/masked_text_controller_phone.dart';
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
        iconTheme: IconThemeData(color: MyColors.black0),
        backgroundColor: MyColors.white,
        elevation: 0,
        title: Text(
          "Hesab yarat",
          style: AppTextStyles.sfPro500
              .copyWith(color: MyColors.black0, fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MySizedBox.h16,
              PhoneFieldRegister(
                controller: MaskedTextController.app(),
              ),
              EmailFieldRegister(),
              MainPassFieldRegister(),
              MySizedBox.h26,
              PolicyCheckbox(),
              MySizedBox.h20,
              AdsCheckbox(),
              MySizedBox.h50,
              DoctoroButton(
                child: Text(
                  "Davam et",
                  style: AppTextStyles.sfPro500
                      .copyWith(color: MyColors.white, fontSize: 15.sp),
                ),
                color: MyColors.grey288,
              )
            ],
          ),
        ),
      ),
    );
  }
}
