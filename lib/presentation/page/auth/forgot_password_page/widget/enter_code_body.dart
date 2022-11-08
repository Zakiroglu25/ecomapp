import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import 'fields/code_field_forgot.dart';
import 'forgot_main_text.dart';
import 'forgot_second_text.dart';

class EnterCodeBody extends StatelessWidget {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Duration(milliseconds: 500),
      key: Key("b"),
      child: Column(
        children: [
          MySizedBox.h30,
          Flash(child: ForgotMainText(MyText.there_is_code_on_mail)),
          MySizedBox.h16,
          ForgotSecondText(MyText.please_enter_code),
          MySizedBox.h16,
          CodeFieldForgot(),
        ],
      ),
    );
  }
}
