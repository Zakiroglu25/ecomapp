import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';

class RecipeText extends StatelessWidget {
  const RecipeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${MyText.recipe}:',
      style: AppTextStyles.sfPro400H2.copyWith(
        color: MyColors.black34,
      ),
    );
  }
}
