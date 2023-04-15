import 'package:flutter/material.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class PashaInsuranceTitleText extends StatelessWidget {
  const PashaInsuranceTitleText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      AppTextStyles.sfPro600
          .copyWith(fontSize: 16, color: MyColors.white),
    );
  }
}
