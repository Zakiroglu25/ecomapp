import 'package:uikit/presentation/page/cart_delivery_page/widgets/recipe_image_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/row_with_space.dart';

class DeliveryRecipe extends StatelessWidget {
  const DeliveryRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      space: 16,
      children: [
        Text(
          "${MyText.recipe}: ",
          style: AppTextStyles.sfPro500s13,
        ),
        RecipeImageButton(),
      ],
    );
  }
}
