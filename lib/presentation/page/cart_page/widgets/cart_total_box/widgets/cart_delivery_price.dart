import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property_manat.dart';

class CartDeliveryPrice extends StatelessWidget {
  const CartDeliveryPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalPropertyManat(
      title: MyText.deliveryPrice,
      value: '20',
    );
  }
}
