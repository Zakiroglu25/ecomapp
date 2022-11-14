// Flutter imports:
// Package imports:

import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';

class NotificationElement extends StatelessWidget {
  final Function? onXTap;
  final bool? increase;
  // final MyNotification notification;

  const NotificationElement({
    Key? key,
    required this.onXTap,
    // required this.notification,
    this.increase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("notification"),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 40.0),
        color: MyColors.red249,
        child: Text(
          "Sil",
          style: AppTextStyles.sfPro600s16.copyWith(color: MyColors.errorRED),
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.red250,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: Paddings.paddingA16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "notification.title!",
                  style: AppTextStyles.sfPro600
                      .copyWith(fontSize: 14, color: MyColors.black34),
                ),
                MySizedBox.h4,
                Text(
                  "notification.description!",
                  style: AppTextStyles.sfPro400s14
                      .copyWith(fontSize: 14, color: MyColors.grey153),
                ),
              ],
            ),
            // decoration: BoxDecoration(
            //     color: (notification.read == 0)
            //         ? MyColors.grey245
            //         : Colors.transparent,
            //     borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }
}
