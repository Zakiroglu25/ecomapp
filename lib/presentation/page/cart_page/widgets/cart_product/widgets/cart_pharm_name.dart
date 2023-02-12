import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';

class CartPharmName extends StatelessWidget {
  const CartPharmName({Key? key, required this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: AppTextStyles.sfPro400h2.copyWith(
        color: MyColors.darkRED,
      ),
    );
  }
}
