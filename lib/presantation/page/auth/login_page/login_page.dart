import 'package:doctoro/presantation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../widget/custom/doctoro_button.dart';
import '../otp_page/otp_page.dart';
import 'widgets/login_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.black0),
        backgroundColor: MyColors.white,
        elevation: 0,
        title: Text(
          "Hesaba daxil ol",
          style: AppTextStyles.sfPro500.copyWith(
              color: MyColors.black0, fontSize: 16.sp, height: 24 / 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Stack(
          children: [
            ListView(
              children: [
                MySizedBox.h16,
                LoginFields(),
                DoctoroButton(
                  onTap: () {
                    Go.to(context, PinCodeVerificationScreen());
                  },
                  child: Text(
                    "Daxil ol",
                    style: AppTextStyles.sfPro500
                        .copyWith(color: MyColors.white, fontSize: 15.sp),
                  ),
                  color: MyColors.grey288,
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.svgLock),
                  MySizedBox.w8,
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Şifrəmi unutdum',
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Go.to(context, ForgotPasswordPage()),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                        style: AppTextStyles.sfPro400.copyWith(
                            color: MyColors.grey130, fontSize: 12.sp)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
