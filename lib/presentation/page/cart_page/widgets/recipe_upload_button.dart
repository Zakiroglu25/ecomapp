import 'package:flutter/material.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class RecipeUploadButton extends StatelessWidget {
  const RecipeUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      radius: 99,
      onTap: () {},
      child: Container(
        //  width: 124,
        height: 36,
        padding: Paddings.paddingH12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("${MyText.uploadRecipe} "),
            Icon(Icons.add_circle_rounded)
          ],
        ),
        decoration: BoxDecoration(
            color: MyColors.green235,
            border: Border.all(color: MyColors.green85),
            borderRadius: Radiuses.r99),
      ),
    );
  }
}
