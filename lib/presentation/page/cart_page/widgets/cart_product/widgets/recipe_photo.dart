import 'package:uikit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/mock.dart';
import '../../../../../../utils/screen/errorable_image.dart';

class RecipePhoto extends StatelessWidget {
  const RecipePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorableImage(
      backColor: MyColors.white,
      imageUrl: MockData.recipeImgURL,
      r: 6,
      w: 64,
      h: 64,
    );
  }
}
