import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/app_text_styles.dart';

class DeliveryPrice extends StatelessWidget {
  const DeliveryPrice({Key? key, required this.price}) : super(key: key);
  final num? price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${MyText.deliveryPrice}:  ${price?.toStringAsFixed(2) ?? 0}₼",
      style: AppTextStyles.sfPro500s13,
    );
  }
}
