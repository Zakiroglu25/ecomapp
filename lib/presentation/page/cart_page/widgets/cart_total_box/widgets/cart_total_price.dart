import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property_manat.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalPropertyManat(
      title: MyText.total,
      value: '3455',
      withBack: true,
    );
  }
}
