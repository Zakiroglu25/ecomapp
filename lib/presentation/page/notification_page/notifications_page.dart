import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/notification_model.dart';

import '../../../infrastructure/cubit/notification_cubit/notification_cubit.dart';
import '../../../infrastructure/cubit/notification_cubit/notification_state.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
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
              // return Center(child: Text("Alindi"));
              return ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationElement(
                      onXTap: () {},
                      list: notificationList[index],
                    );
                  });

            } else if (state is NotificationError) {
              return Center(child: Text("alinmadi"));
            } else {
              return EmptyWidget();
            }
          },
        )
        // body: BlocConsumer<NotificationCubit, NotificationState>(
        //   listener: (context, state) {
        //     if (state is NotificationRemoveSuccess) {
        //       context.read<NotificationCubit>().fetch();
        //     }
        //   },
        //   builder: (context, state) {
        //     if (state is NotificationSuccess) {
        //       if (state.notificationList.isEmpty) {
        //         return NotificationEmptyWidget();
        //       }
        //       return NotificationGroupedList(
        //         notificationList: state.notificationList,
        //       );
        //     } else if (state is NotificationInProgress) {
        //       return CaspaLoading();
        //     } else {
        //       return EmptyWidget();
        //     }
        //   },
        // ),
        );
  }
}
