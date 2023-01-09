import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../infrastructure/model/response/messenger_users.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import 'chat_details.dart';
import 'delete_item.dart';
import 'image_message.dart';
import 'message_item_widget.dart';
import 'title_message.dart';

class BodyMessenger extends StatelessWidget {
  BodyMessenger({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<Data> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
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
                  children:  [
                    ImageMessage(),
                    MySizedBox.w12,
                    TitleMessage(list[index])
                  ],
                ),
              ),
            ));
        ;
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16),
          child: Divider(),
        );
      },
    );
  }
}
