import 'package:flutter/material.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_price.dart';

import '../../../../infrastructure/model/response/product_option_model.dart';
import '../../../../infrastructure/model/response/search_items.dart';
import 'product_cart_button.dart';

class ProductPriceAndCartButton extends StatelessWidget {
  const ProductPriceAndCartButton({Key? key, required this.product})
      : super(key: key);
  final SimpleProduct product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductPrice(
            price: product.price,
          ),
          ProductCartButton(guid: product.guid!)
        ],
      ),
    );
  }
}
