import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import 'chat_details.dart';
import 'delete_item.dart';
import 'image_message.dart';
import 'title_message.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Go.to(context, Chat());
        },
        child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.20,
            motion: const ScrollMotion(),
            children: [
              DeleteItem(),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [ImageMessage(), MySizedBox.w12, TitleMessage()],
            ),
          ),
        ));
  }
}
