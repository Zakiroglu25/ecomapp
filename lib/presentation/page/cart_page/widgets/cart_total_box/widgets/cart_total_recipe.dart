import 'package:doctoro/presentation/page/cart_page/widgets/cart_product/widgets/recipe_file_delete_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property.dart';

class CartTotalRecipe extends StatelessWidget {
  const CartTotalRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalProperty(
        title: MyText.recipe, value: RecipeFileDeleteButton());
  }
}
