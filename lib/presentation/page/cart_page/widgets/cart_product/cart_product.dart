import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:flutter/material.dart';

import 'widgets/med_photo.dart';
import 'widgets/med_product_details.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, this.url, this.recipeRequired})
      : super(key: key);
  final String? url;
  final bool? recipeRequired;

  @override
  Widget build(BuildContext context) {
    return AppElementBox(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MedPhoto(),
        MySizedBox.w12,
        MedProductDetails(
          url: url,
          recipeRequired: recipeRequired,
        )
      ],
    ));
  }
}
