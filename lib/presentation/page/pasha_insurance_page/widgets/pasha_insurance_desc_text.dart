import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class PashaInsuranceDescText extends StatelessWidget {
  const PashaInsuranceDescText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        style: AppTextStyles.sfPro400s14
            .copyWith(fontSize: 13, color: MyColors.white),
        textAlign: TextAlign.start,
    );
  }
}
