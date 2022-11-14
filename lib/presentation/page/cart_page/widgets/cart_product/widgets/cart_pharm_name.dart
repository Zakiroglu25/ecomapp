import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/mock.dart';

class CartPharmName extends StatelessWidget {
  const CartPharmName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      MockData.pharmName,
      style: AppTextStyles.sfPro400h2.copyWith(
        color: MyColors.darkRED,
      ),
    );
  }
}
