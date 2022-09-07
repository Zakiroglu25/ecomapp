import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';

class CartTotalProperty extends StatelessWidget {
  const CartTotalProperty({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title :",
          style: AppTextStyles.sfPro400s16,
        ),
        value
      ],
    );
  }
}
