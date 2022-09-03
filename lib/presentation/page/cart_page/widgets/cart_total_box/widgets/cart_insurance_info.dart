import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text.dart';

class CartInsuranceInfo extends StatelessWidget {
  const CartInsuranceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      MyText.insuranceInfo,
      style: AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
    );
  }
}
