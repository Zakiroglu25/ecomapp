import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/cart_items.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import '../../../../../widgets/main/product_item/widgets/product_image.dart';
import 'widgets/med_photo.dart';
import 'widgets/med_product_details.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.item}) : super(key: key);

  final CartItem? item;

  @override
  Widget build(BuildContext context) {
    return AppElementBox(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImage(
          imageUrl: item?.productOptionImages.firstOrNull,
        ),
        // MedPhoto(
        //   productOptionImages: item?.productOptionImages,
        // ),
        MySizedBox.w12,
        MedProductDetails(
          item: item,
          // url: url,
          // recipeRequired: recipeRequired,
        )
      ],
    ));
  }
}
