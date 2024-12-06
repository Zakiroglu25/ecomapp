import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/send_again_row.dart';

import '../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import 'fields/code_field_forgot.dart';
import 'forgot_main_text.dart';
import 'forgot_second_text.dart';

class EnterCodeBody extends StatelessWidget {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgotPassCubit>();
    return FadeInRight(
      duration: Duration(milliseconds: 500),
      key: Key("b"),
      child: Column(
        children: [
          MySizedBox.h30,
          Flash(child: ForgotMainText(MyText.enterCode)),
          MySizedBox.h16,
          ForgotSecondText(MyText.codeSent),
          MySizedBox.h16,
          CodeFieldForgot(),
          SendAgainRow(
            onTap: () => cubit.requestOTP(context),
            countdownTimeStream: cubit.countdownTimeStream,
          ),
        ],
      ),
    );
  }
}
