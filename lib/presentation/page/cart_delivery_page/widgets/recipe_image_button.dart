import 'package:doctoro/utils/extensions/word.dart';
import 'package:doctoro/widgets/custom/app_unicorn_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/mock.dart';

class RecipeImageButton extends StatelessWidget {
  const RecipeImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppUnicornButton(
        child: Text(
      MockData.medicineImgName.clip14,
      overflow: TextOverflow.clip,
    ));
  }
}
