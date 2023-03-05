import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import 'fields/number_field.dart';
import 'forgot_main_text.dart';
import 'forgot_second_text.dart';

class EnterMailBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox.h30,
          ForgotMainText(MyText.are_you_forgot_pass),
          MySizedBox.h16,
          ForgotSecondText(MyText.smsCodeWillSend),
          MySizedBox.h16,
          PhoneFieldForgot(),
        ],
      ),
    );
  }
}
