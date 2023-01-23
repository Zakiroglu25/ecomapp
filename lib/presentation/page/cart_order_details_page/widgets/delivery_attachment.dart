import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/recipe_image_button.dart';
import 'package:uikit/utils/extensions/object.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/row_with_space.dart';

class DeliveryAttachment extends StatelessWidget {
  const DeliveryAttachment({Key? key, required this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: image.isNotNull,
      child: SpacedRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        space: 16,
        children: [
          const Text("${MyText.recipe}: ", style: AppTextStyles.sfPro500s13),
          RecipeImageButton(attachmentImageUrl: image),
        ],
      ),
    );
  }
}
