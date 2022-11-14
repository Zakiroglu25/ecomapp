import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../utils/constants/assets.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import 'forgot_main_text.dart';
import 'forgot_second_text.dart';

class PassChangedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Duration(milliseconds: 500),
      key: Key("c"),
      child: Column(
        children: [
          MySizedBox.h30,
          Flash(child: ForgotMainText(MyText.setted_new_pass)),
          MySizedBox.h16,
          ForgotSecondText(MyText.we_have_sent_new_pass_email),
          MySizedBox.h16,
          Container(
              height: 200.sp,
              width: 200.sp,
              child: Lottie.asset(Assets.animSuccessOpt, repeat: false))
        ],
      ),
    );
  }
}
