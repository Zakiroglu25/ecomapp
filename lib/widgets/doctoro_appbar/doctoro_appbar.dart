// Flutter imports:

import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/doctoro_appbar/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../presentation/page/product_page/widgets/appbar_address_widget.dart';
import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';
import '../../utils/screen/widget_or_empty.dart';
import 'widgets/actions_button.dart';
import 'widgets/back_i_o_s.dart';
import 'widgets/notification_widget.dart';
import 'widgets/user_button.dart';

class DoctorAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  //final bool? back;
  final bool filter;
  final bool notification;
  final bool? exitButton;
  final bool? user;
  final bool? back;
  final Function? onBack;
  final BuildContext? contextA;
  //final bool? actions;
  final Function? onTapActions;
  final bool? centerTitle;
  final Color? color;
  final bool addressDropdown;
  final List<Widget>? actions;

  DoctorAppbar(
      {required this.title,
      required this.user,
      this.notification = true,
      this.addressDropdown = false,
      this.exitButton,
      this.actions,
      this.color,
      this.back = true,
      this.onBack,
      this.onTapActions,
      required this.contextA,
      this.centerTitle,
      this.filter = false});

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        if (notification) {
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
            !addressDropdown
                ? Center(
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.sfPro600
                          .copyWith(fontSize: 17.sp, color: MyColors.black),
                    ),
                  )
                : AppBarAddressWidget(),
            rightButtonsRow(context),
          ],
        ),
      ),
    );
  }

  Row rightButtonsRow(BuildContext contextZ) {
    return Row(
      children: [
        (notification)
            ? NotificationWidget()
            : (actions == null ? MySizedBox.w10 : Container()),
        //...actions,

        ...?actions,
        // actions!=null? (...?actions) : Container(),
        // ActionsButton(
        //   onTap: onTapActions,
        // ),
        // (filter)
        //     ? FilterWidget()
        //     : (onTapActions == null ? MySizedBox.w20 : Container()),
        //actions.isNotEmptyOrNull ? MySizedBox.w16 : MySizedBox.zero,
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
