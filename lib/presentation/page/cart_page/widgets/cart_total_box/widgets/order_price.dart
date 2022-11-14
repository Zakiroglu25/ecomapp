import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property_manat.dart';

class CartOrdersPrice extends StatelessWidget {
  const CartOrdersPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalPropertyManat(
      title: MyText.orders,
      value: '3435',
    );
  }
}
