import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property_manat.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice(this.totalPrice, {Key? key}) : super(key: key);
  final num? totalPrice;

  @override
  Widget build(BuildContext context) {
    return CartTotalPropertyManat(
      title: MyText.total,
      value: totalPrice,
      withBack: true,
    );
  }
}
