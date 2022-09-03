import 'package:doctoro/utils/constants/boxx.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/screen/widget_or_empty.dart';
import 'package:doctoro/widgets/custom/row_with_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../doctoro_appbar/widgets/back_i_o_s.dart';
import '../../doctoro_appbar/widgets/notification_widget.dart';
import '../../doctoro_appbar/widgets/user_button.dart';

class Cupperfold extends StatelessWidget {
  const Cupperfold({
    Key? key,
    required this.child,
    this.title,
    this.leadings,
    this.trailings,
    this.back = true,
    this.onBack,
    this.user = true,
    this.notification = true,
  }) : super(key: key);

  final Widget child;
  final String? title;
  final List<Widget>? leadings;
  final List<Widget>? trailings;
  final bool? user;
  final bool? notification;
  final bool? back;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // A ScrollView that creates custom scroll effects using slivers.
        backgroundColor: MyColors.white,
        body: SafeArea(
          child: CustomScrollView(
            clipBehavior: Clip.antiAlias,
            // A list of sliver widgets.
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                backgroundColor: MyColors.white,
                padding: EdgeInsetsDirectional.zero,
                border:
                    const Border(bottom: BorderSide(color: Colors.transparent)),
                leading: SpacedRow(
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
                largeTitle: Text(title ?? ''),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...trailings ?? [],
                    WidgetOrEmpty(
                        value: notification, child: NotificationWidget()),
                  ],
                ),
              ),
              // This widget fills the remaining space in the viewport.
              // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.

              SliverList(
                // shrinkWrap: false,
                // physics: Physics.alwaysBounce,
                delegate: SliverChildListDelegate([child]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
