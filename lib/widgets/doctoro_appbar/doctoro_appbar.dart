// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../presentation/page/products_page/widgets/appbar_address_widget.dart';
import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';
import '../../utils/screen/widget_or_empty.dart';
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
        title: Padding(
          padding: Paddings.zero,
          child: Row(
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
                            .copyWith(fontSize: 16.sp, color: MyColors.black),
                      ),
                    )
                  : const AppBarAddressWidget(),
              rightButtonsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Row rightButtonsRow(BuildContext contextZ) {
    return Row(
      children: [
        (notification)
            ? NotificationWidget()
            : (actions == null ? MySizedBox.w40 : Container()),
        //...actions,
        // (share!)
        //     ? Padding(
        //   padding: Paddings.paddingT2 + Paddings.paddingR16,
        //       child: SvgPicture.asset(
        //           Assets.svgShare,
        //           color: MyColors.black,
        //         ),
        //     )
        //     : (share == null ? MySizedBox.w20 : Container()),
        // ...?actions,
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
