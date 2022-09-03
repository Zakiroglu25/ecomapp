import 'package:doctoro/utils/extensions/word.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/border_radius.dart';
import '../../../../../utils/constants/gradients.dart';
import '../../../../../utils/constants/mock.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../widgets/general/colorfull_bordered.dart';

class RecipeFileDeleteButton extends StatelessWidget {
  const RecipeFileDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      onPressed: () {},
      gradient: Gradients.gBack,
      strokeWidth: 1,
      padding: Paddings.paddingA2,
      radius: 99,
      child: Container(
        padding: Paddings.paddingH12 + Paddings.paddingV8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              MockData.medicineImgName.clip14,
              overflow: TextOverflow.clip,
            ),
            Icon(Icons.cancel_rounded)
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: Radiuses.r99, gradient: Gradients.gBorder),
      ),
    );
  }
}
