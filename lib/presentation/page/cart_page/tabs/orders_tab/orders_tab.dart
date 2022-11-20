import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_product/cart_product.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/cart_total_box.dart';
import 'package:uikit/utils/constants/mock.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../../widgets/custom/listview_separated.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);
  static const List products = [
    const CartProduct(),
    const CartProduct(
      recipeRequired: true,
    ),
    const CartProduct(
      recipeRequired: true,
      url: MockData.recipeImgURL,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: [
        ListViewSeparated(
          shrinkWrap: true,
          physics: Physics.never,
          // space: 16,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return products[index];
          },
        ),
        MySizedBox.h16,
        const CartTotalBox(),
      ],
    ));
  }
}
