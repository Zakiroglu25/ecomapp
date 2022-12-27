import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/sized_box.dart';

class TitleMessage extends StatelessWidget {
  const TitleMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Kanon Aptek",
          style: AppTextStyles.sfPro600s16,
        ),
        MySizedBox.h4,
        SizedBox(
          width: 260,
          child: Text(
            MyText.demo,
            style: AppTextStyles.sfPro400s14.copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
