import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_image.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../infrastructure/model/response/product_option_model.dart';
import 'widgets/product_details_and_buttons.dart';

class NewProductItem extends StatelessWidget {
  const NewProductItem({Key? key, required this.product}) : super(key: key);
  final SimpleProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      padding: Paddings.paddingA12,
      decoration:
          BoxDecoration(borderRadius: Radiuses.r12, color: MyColors.grey245),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(imageUrl: product.imageUrl),
          MySizedBox.w12,
          ProductDetailsAndButtons(
            product: product,
          )
        ],
      ),
    );
  }
}
