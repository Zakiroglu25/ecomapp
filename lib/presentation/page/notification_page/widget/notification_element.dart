// Flutter imports:
// Package imports:

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/infrastructure/model/response/notification_model.dart';

import '../../../../infrastructure/cubit/notification_cubit/notification_cubit.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/screen/alert.dart';
import '../../notification_details_page/notification_details_page.dart';

class NotificationElement extends StatelessWidget {
  final Function? onXTap;
  final bool? increase;
  final Notificationse list;

  const NotificationElement({
    Key? key,
    required this.onXTap,
    this.increase,
    required this.list,
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
      confirmDismiss: (DismissDirection direction) async {
        return Alert.show(
          context,
          title: "MyText.are_u_sure_delete",
          buttonText: MyText.yes,
          cancelButton: true,
          onTap: () => context.read<NotificationCubit>().removeNotificion(
              context: context, loading: false, notificationId: list.guid!),
          image: SizedBox(
            width: 120.sm,
            height: 120.sm,
            child: Image.asset(Assets.medicine),
          ),
        );
      },
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Go.to(context, NotificationDetailsPage(list:list));

            },
            child: Container(
              padding: Paddings.paddingA16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list.title!,
                    style: AppTextStyles.sfPro600
                        .copyWith(fontSize: 14, color: MyColors.black34),
                  ),
                  MySizedBox.h4,
                  Row(
                    children: [
                      Text(
                        list.body!,
                        style: AppTextStyles.sfPro400s14
                            .copyWith(fontSize: 14, color: MyColors.grey153),
                      ),
                      Spacer(),
                      Text(list.createdAt!.substring(0, 10),
                          style: AppTextStyles.sfPro400s14
                              .copyWith(fontSize: 10, color: MyColors.grey153))
                    ],
                  ),
                ],
              ),
              // decoration: BoxDecoration(
              //     color: (notification.read == 0)
              //         ? MyColors.grey245
              //         : Colors.transparent,
              //     borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
