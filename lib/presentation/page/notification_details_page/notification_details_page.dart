import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/infrastructure/model/response/notification_model.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';

class NotificationDetailsPage extends StatelessWidget {
  NotificationDetailsPage({Key? key, required this.list}) : super(key: key);
  final Notificationse list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "",
        notification: false,
        filter: false,
        addressDropdown: false,
        user: false,
        contextA: context,
      ),
      body: ListView(
        padding: Paddings.paddingA16,
        children: [
          Text(
            list.title!,
            style: AppTextStyles.sfPro700.copyWith(fontSize: 20.sp),
          ),
          MySizedBox.h16,
          Text(
            list.body!,
            style: AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey165),
          ),
        ],
      ),
    );

    // return Center(
    //   child: Text(list.title!),
    // );
  }
}
