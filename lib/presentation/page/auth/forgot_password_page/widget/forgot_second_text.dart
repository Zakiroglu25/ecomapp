import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';

class ForgotSecondText extends StatelessWidget {
  String text;

  ForgotSecondText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyles.sfPro400s14
          .copyWith(fontSize: 14, color: MyColors.grey165),
    );
  }
}
