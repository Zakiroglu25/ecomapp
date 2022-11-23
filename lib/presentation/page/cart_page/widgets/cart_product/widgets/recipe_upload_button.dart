import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

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
