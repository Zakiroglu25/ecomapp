import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/messenger_users.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/sized_box.dart';

class TitleMessage extends StatelessWidget {
  final Data? list;

  TitleMessage(this.list);

  @override
  Widget build(BuildContext context) {
    String lastMessage = list!.lastMessage!;
    String truncatedMessage = lastMessage.length > 20
        ? lastMessage.substring(0, 30) + '...'
        : lastMessage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          list!.storeName!,
          style: AppTextStyles.sfPro600s16,
        ),
        MySizedBox.h4,
        SizedBox(
          child: Text(
            truncatedMessage,
            style: AppTextStyles.sfPro400s14.copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
