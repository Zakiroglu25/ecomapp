import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';

import '../../../general/manat_price.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({Key? key, required this.price}) : super(key: key);
  final double? price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        ManatPrice(price: price),
        Text(
          "-dan",
          style: AppTextStyles.sfPro700.copyWith(fontSize: 16),
        )
      ],
    ));
  }
}
