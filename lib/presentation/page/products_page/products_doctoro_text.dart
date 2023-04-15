import 'package:flutter/material.dart';

import '../../../infrastructure/config/configs.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/paddings.dart';

class ProductsDoctoroText extends StatelessWidget {
  const ProductsDoctoroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16 + Paddings.paddingT10,
      child: Text(
        Configs.appName,
        style: AppTextStyles.sfPro700.copyWith(fontSize: 30),
      ),
    );
  }
}
