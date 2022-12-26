import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_product/widgets/recipe_file_delete_button.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property.dart';

class CartTotalRecipe extends StatelessWidget {
  const CartTotalRecipe({
    Key? key,
    required this.url,
    required this.cartGuid,
  }) : super(key: key);
  final String? url;
  final String? cartGuid;
  @override
  Widget build(BuildContext context) {
    return CartTotalProperty(
        title: MyText.recipe,
        value: RecipeFileDeleteButton(
          url: url,
          cartGuid: cartGuid,
        ));
  }
}
