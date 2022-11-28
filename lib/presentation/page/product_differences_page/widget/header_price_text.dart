import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class PriceTitleWidget extends StatelessWidget {
  const PriceTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        "QIYMƏTLƏR",
        style: AppTextStyles.sfPro400s16.copyWith(color: MyColors.grey188),
      ),
    );
  }
}
