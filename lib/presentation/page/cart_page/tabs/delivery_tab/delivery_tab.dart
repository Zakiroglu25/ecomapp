import 'package:doctoro/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/enums/cart_order_type.dart';
import 'package:doctoro/widgets/custom/listview_separated.dart';
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
