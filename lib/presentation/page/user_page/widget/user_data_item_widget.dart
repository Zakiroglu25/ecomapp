import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';

class UserDataWidgetItem extends StatelessWidget {
  const UserDataWidgetItem({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySizedBox.h8,
        Text(
          title!,
          style: AppTextStyles.sfPro500s13.copyWith(color: MyColors.grey158),
        ),
        MySizedBox.h2,
        if (content != null)
          Text(
            content!,
            style: AppTextStyles.sfPro600s16,
          ),
        if (content == null)
          const Text(
            "Qeyd Olunmayıb",
            style: AppTextStyles.sfPro600s16,
          ),
      ],
    );
  }
}
