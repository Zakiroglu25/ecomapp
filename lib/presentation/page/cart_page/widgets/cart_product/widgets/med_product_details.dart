import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/cart_items.dart';

import '../../../../../../widgets/custom/column_with_space.dart';
import '../../../../../../widgets/general/manat_price.dart';
import 'cart_counter.dart';
import 'cart_med_name.dart';
import 'cart_pharm_name.dart';
import 'receip_box.dart';

class MedProductDetails extends StatelessWidget {
  const MedProductDetails(
      {Key? key, this.url, this.recipeRequired, required this.item})
      : super(key: key);
  final String? url;
  final bool? recipeRequired;
  final CartItem? item;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SpacedColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        space: 8,
        children: [
          CartMedName(name: item?.title),
          CartPharmName(
            name: item?.storeName,
          ),
          RecipeBox(
            recipeRequired: item?.prescriptionRequired,
            url: item?.prescriptionImage,
            cartGuid: item?.guid,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ManatPrice(price: calculate(item?.amount, item?.price)),
              CartCounter(item: item)
            ],
          ),
        ],
      ),
    );
  }

  num calculate(num? amount, num? price) {
    if (amount == null || price == null) return 0;
    return amount * price;
  }
}
