import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import 'recipe_file_delete_button.dart';
import 'recipe_photo.dart';
import 'recipe_text.dart';
import 'recipe_upload_button.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox({Key? key, this.url, this.recipeRequired = false})
      : super(key: key);
  final String? url;
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
          WidgetOrEmpty(
            value: url != null,
            child: SpacedColumn(
              space: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [RecipeFileDeleteButton(), RecipePhoto()],
            ),
            elseChild: RecipeUploadButton(),
          )
        ],
      ),
    );
  }
}
