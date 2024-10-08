import 'package:flutter/material.dart';

import '../../../../infrastructure/model/response/search_items.dart';
import 'product_title.dart';

class ProductTitleAndFavButton extends StatelessWidget {
  const ProductTitleAndFavButton({Key? key, required this.product})
      : super(key: key);
  final SimpleProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductTitle(
          title: product.title,
        ),
        const SizedBox(height: 48, width: 48)
      ],
    );
  }
}
