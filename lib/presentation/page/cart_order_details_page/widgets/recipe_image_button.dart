import 'package:flutter/material.dart';
import 'package:uikit/utils/extensions/word.dart';
import 'package:uikit/widgets/custom/app_unicorn_button.dart';

import '../../../../utils/constants/mock.dart';

class RecipeImageButton extends StatelessWidget {
  const RecipeImageButton({Key? key, required this.attachmentImageUrl})
      : super(key: key);
  final String? attachmentImageUrl;
  @override
  Widget build(BuildContext context) {
    return AppUnicornButton(
        child: Text(
      attachmentImageUrl!.clip14,
      overflow: TextOverflow.clip,
    ));
  }
}
