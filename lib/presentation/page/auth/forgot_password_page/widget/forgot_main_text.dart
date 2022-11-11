import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_text_styles.dart';

class ForgotMainText extends StatelessWidget {
  String text;

  ForgotMainText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.sfPro400s14.copyWith(fontSize: 25),
    );
  }
}
