import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../widget/custom/doctoro_button.dart';
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
            style: AppTextStyles.sfPro500
                .copyWith(color: MyColors.black0, fontSize: 16.sp,height: 24/16),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySizedBox.h16,
                LoginFields(),
                MySizedBox.h50,
                DoctoroButton(
                  child: Text(
                    "Daxil ol",
                    style: AppTextStyles.sfPro500
                        .copyWith(color: MyColors.white, fontSize: 15.sp),
                  ),
                  color: MyColors.grey288,
                )
              ],
            ),
          ),
        ), ,
    );
  }
}
