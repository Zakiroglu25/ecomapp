// Flutter imports:

import 'package:doctoro/widget/doctoro_appbar/widget/filter.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/sized_box.dart';
import '../../util/screen/widget_or_empty.dart';
import 'widget/actions_button.dart';
import 'widget/back_i_o_s.dart';
import 'widget/notification_widget.dart';
import 'widget/user_button.dart';

class DoctorAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  //final bool? back;
  final bool? filter;
  final bool? notification;
  final bool? exitButton;
  final bool? user;
  final bool? back;
  final BuildContext? contextA;
  final bool? actions;
  final Function? onTapActions;
  final bool? centerTitle;
  final Color? color;
  final Function? onBack;

  DoctorAppbar(
      {required this.title,
      @required this.user,
      this.notification,
      this.exitButton,
      this.actions,
      this.color,
      this.back = true,
      this.onBack,
      this.onTapActions,
      required this.contextA,
      this.centerTitle,
      this.filter});

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        if (notification ?? true) {
          //  context.read<HeaderCubit>()..fetch();
        }
      },
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color ?? Colors.white,
        foregroundColor: color,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (user ?? true)
                ? UserButton()
                : WidgetOrEmpty(
                    value: back,
                    child: BackIOS(
                      onBack: onBack,
                    ),
                  ),
            Center(
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.sfPro600
                    .copyWith(fontSize: 17.sp, color: MyColors.black0),
              ),
            ),
            rightButtonsRow(context),
          ],
        ),
      ),
    );
  }

  Row rightButtonsRow(BuildContext contextZ) {
    return Row(
      children: [
        (notification ?? true)
            ? NotificationWidget()
            : (onTapActions == null ? MySizedBox.w10 : Container()),
        ActionsButton(
          onTap: onTapActions,
        ),
        (filter ?? true)
            ? FilterWidget()
            : (onTapActions == null ? MySizedBox.w20 : Container()),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
