import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/notification_model.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../../../infrastructure/cubit/notification_cubit/notification_cubit.dart';
import '../../../infrastructure/cubit/notification_cubit/notification_state.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/general/empty_widget.dart';
import 'widget/notification_element.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DoctorAppbar(
          title: MyText.notification,
          notification: false,
          filter: false,
          addressDropdown: false,
          user: false,
          contextA: context,
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationSuccess) {
              List<Notificationse>? notificationList =
                  state.notificationList.data;
              if (notificationList.isEmpty) {
                return EmptyWidget(
                  imageUrl: Assets.notifyheart,
                  text: MyText.emptyNotification,
                  description: MyText.emptyNotiDetail,
                  color: MyColors.orange254,
                );
              }
              return ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationElement(
                      onXTap: () {},
                      list: notificationList[index],
                    );
                  });
            } else if (state is NotificationProgress) {
              return AppLoading();
            } else {
              return EmptyWidget(
                imageUrl: Assets.notifyheart,
                text: MyText.emptyNotification,
                description: MyText.emptyNotiDetail,
              );
            }
          },
        ));
  }
}
