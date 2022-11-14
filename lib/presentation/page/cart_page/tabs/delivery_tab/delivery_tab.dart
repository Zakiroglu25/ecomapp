import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/enums/cart_order_type.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:flutter/material.dart';

class DeliveryTab extends StatelessWidget {
  const DeliveryTab({Key? key}) : super(key: key);
  static const List products = [
    CartOrderProduct(
      cartOrderType: CartOrderType.confirmed,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListviewSeparated(
      //  shrinkWrap: true,
      physics: Physics.never,
      // space: 16,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return products[index];
      },
    );
  }
}
