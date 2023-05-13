import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../infrastructure/model/response/messenger_users.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import 'delete_item.dart';
import 'image_message.dart';
import 'title_message.dart';

class BodyMessenger extends StatelessWidget {
  BodyMessenger({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<Data> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Go.to(
                      context,
                      Pager.chat(
                          guid: list[index].guid,
                          storeName: list[index].storeName!));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ImageMessage(),
                      MySizedBox.w12,
                      TitleMessage(list[index])
                    ],
                  ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: Divider(),
            );
          },
        ),
      ],
    );
  }
}
