import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/mock.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/extensions/word.dart';
import 'package:uikit/widgets/custom/app_unicorn_button.dart';

import '../../../../../../utils/constants/gradients.dart';

class RecipeFileDeleteButton extends StatelessWidget {
  const RecipeFileDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppUnicornButton(
      onPressed: () {},
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
