import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_text_styles.dart';

class ForgotMainText extends StatelessWidget {
  String text;

  ForgotMainText(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: AppTextStyles.sfPro600s30.copyWith(fontSize: 25, height: 0.5),
      ),
    );
  }
}
