import 'package:flutter/material.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/screen/widget_or_empty.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/paddings.dart';
import '../../../custom/row_with_space.dart';
import '../../../custom/sliver_app_bar_delegate.dart';
import '../../../doctoro_appbar/widgets/back_i_o_s.dart';
import '../../../doctoro_appbar/widgets/notification_widget.dart';
import '../../../doctoro_appbar/widgets/user_button.dart';

class AppSliverPersistentCupertinoAppbar extends StatelessWidget {
  const AppSliverPersistentCupertinoAppbar({
    Key? key,
    this.title,
    this.leadings,
    this.trailings,
    this.barColor,
    this.back = true,
    this.onBack,
    this.user = true,
    this.notification = true,
  }) : super(key: key);
  final String? title;
  final List<Widget>? leadings;
  final List<Widget>? trailings;
  final bool? user;
  final bool? notification;
  final bool? back;
  final Color? barColor;
  final Function? onBack;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: true,
        pinned: false,
        delegate: SliverAppBarDelegate(
            maxExtent_: 56,
            minExtent_: 56,
            child: CupertinoNavigationBar(
              backgroundColor: barColor ?? MyColors.white,
              padding: EdgeInsetsDirectional.zero,
              automaticallyImplyLeading: false,
              //  automaticallyImplyTitle: false,
              border:
                  const Border(bottom: BorderSide(color: Colors.transparent)),
              leading: SpacedRow(
                padding: Paddings.paddingT4,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WidgetOrEmpty(
                    value: user,
                    child: UserButton(),
                    elseChild: WidgetOrEmpty(
                      value: back,
                      child: BackIOS(
                        onBack: onBack,
                      ),
                    ),
                  ),
                  ...leadings ?? [],
                ],
              ),
              // This title is visible in both collapsed and expanded states.
              // When the "middle" parameter is omitted, the widget provided
              // in the "largeTitle" parameter is used instead in the collapsed state.
              middle: Text(title ?? ''),
              trailing: SpacedRow(
                padding: Paddings.paddingT4,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...trailings ?? [],
                  WidgetOrEmpty(
                      value: notification, child: NotificationWidget()),
                ],
              ),
            )));
  }
}
