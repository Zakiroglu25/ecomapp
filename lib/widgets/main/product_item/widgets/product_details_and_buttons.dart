import 'package:flutter/material.dart';

import '../../../../infrastructure/model/response/search_items.dart';
import '../../../../utils/constants/sized_box.dart';
import 'product_price_and_cart_button.dart';
import 'product_title_and_fav_button.dart';

class ProductDetailsAndButtons extends StatelessWidget {
  const ProductDetailsAndButtons({Key? key, required this.product})
      : super(key: key);
  final SimpleProduct product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        //  space: 8,
        children: [
          ProductTitleAndFavButton(
            product: product,
          ),
          MySizedBox.h8,
          ProductPriceAndCartButton(
            product: product,
          )
        ],
      ),
    );
  }
}
