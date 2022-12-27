import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import '../../../../../../utils/constants/durations.dart';
import '../../../../../../widgets/main/product_item/widgets/product_image.dart';
import 'recipe_file_delete_button.dart';
import 'recipe_text.dart';
import 'recipe_upload_button.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox(
      {Key? key, this.url, required this.cartGuid, this.recipeRequired = false})
      : super(key: key);
  final String? url;
  final String? cartGuid;
  final bool? recipeRequired;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: recipeRequired,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecipeText(),
          AnimatedSize(
            duration: Durations.ms300,
            child: WidgetOrEmpty(
              value: url != null,
              child: SpacedColumn(
                space: 8,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RecipeFileDeleteButton(url: url, cartGuid: cartGuid),
                  ProductImage(imageUrl: url)
                  //RecipePhoto(url: url)
                ],
              ),
              elseChild: RecipeUploadButton(guid: cartGuid),
            ),
          )
        ],
      ),
    );
  }
}
