import 'package:flutter/material.dart';

import '../../../../../widgets/custom/column_with_space.dart';
import '../../../../../widgets/general/manat_price.dart';
import 'cart_counter.dart';
import 'cart_med_name.dart';
import 'cart_pharm_name.dart';
import 'receip_box.dart';

class MedProductDetails extends StatelessWidget {
  const MedProductDetails({Key? key, this.url, this.recipeRequired})
      : super(key: key);
  final String? url;
  final bool? recipeRequired;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SpacedColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        space: 8,
        children: [
          const CartMedName(),
          const CartPharmName(),
          RecipeBox(
            recipeRequired: recipeRequired,
            url: url,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ManatPrice(price: "1212"), const CartCounter()],
          ),
        ],
      ),
    );
  }
}
