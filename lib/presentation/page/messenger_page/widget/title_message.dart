import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/messenger_users.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/sized_box.dart';

class TitleMessage extends StatelessWidget {

  final Data? list;

  TitleMessage(this.list);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text(
          list!.storeName!,
          style: AppTextStyles.sfPro600s16,
        ),
        MySizedBox.h4,
        Text(
          list!.lastMessage!,
          style: AppTextStyles.sfPro400s14.copyWith(height: 1.5),
        ),
      ],
    );
  }
}
