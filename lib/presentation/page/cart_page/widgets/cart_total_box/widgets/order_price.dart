import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property_manat.dart';

class CartOrdersPrice extends StatelessWidget {
  const CartOrdersPrice(this.totalOrderPrice, {Key? key}) : super(key: key);
  final num? totalOrderPrice;

  @override
  Widget build(BuildContext context) {
    return CartTotalPropertyManat(
      title: MyText.orders,
      value: '$totalOrderPrice',
    );
  }
}
