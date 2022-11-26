import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/app_text_styles.dart';

class DeliveryTotalPrice extends StatelessWidget {
  const DeliveryTotalPrice({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${MyText.totalPrice}:  $price₼",
      style: AppTextStyles.sfPro500s13,
    );
  }
}
