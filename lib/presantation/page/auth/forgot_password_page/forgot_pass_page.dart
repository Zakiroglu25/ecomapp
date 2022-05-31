import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
    );
  }
}
