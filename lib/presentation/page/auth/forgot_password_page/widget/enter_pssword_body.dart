import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import 'fields/main_pass_field_forgot.dart';
import 'fields/second_pass_field_forgot.dart';
import 'forgot_main_text.dart';
import 'forgot_second_text.dart';

class EnterPasswordBody extends StatelessWidget {
  TextEditingController mainPassController = TextEditingController();
  TextEditingController secondPassController = TextEditingController();

  EnterPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Duration(milliseconds: 500),
      key: Key("b"),
      child: Column(
        // shrinkWrap: true,
        children: [
          MySizedBox.h30,
          ForgotMainText(MyText.set_new_pass),
          MySizedBox.h16,
          ForgotSecondText(MyText.enterNewPassAndTapGoOnButton),
          MySizedBox.h40,
          MainPassFieldForgot(controller: mainPassController),
          SecondPassFieldForgot(controller: secondPassController),
        ],
      ),
    );
  }
}
