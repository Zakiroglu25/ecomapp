import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/main/cupperfold/widgets/app_sliver_persistent_cupertino_appbar.dart';

import 'widgets/custom_cupertino_sliver_navigation_bar.dart';

class Cupperfold extends StatelessWidget {
  const Cupperfold({
    Key? key,
    this.child,
    this.title,
    this.leadings,
    this.trailings,
    this.barColor,
    this.backColor = MyColors.white,
    this.back = true,
    this.onBack,
    this.floatingActionButton,
    this.slivers,
    this.showAppbarLittleText = false,
    this.user = true,
    this.notification = true,
  }) : //assert(child != null || slivers != null),
        super(key: key);

  final Widget? child;
  final String? title;
  final List<Widget>? leadings;
  final List<Widget>? trailings;
  final bool? user;
  final bool? notification;
  final Color? barColor;
  final Color? backColor;
  final bool? back;
  final bool showAppbarLittleText;
  final Widget? floatingActionButton;
  final Function? onBack;
  final List<Widget>? slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      floatingActionButton: floatingActionButton,
      backgroundColor: backColor,
      body: SafeArea(
        child: CustomScrollView(
          clipBehavior: Clip.antiAlias,
          // A list of sliver widgets.
          physics: Physics.alwaysClamp,
          slivers: <Widget>[
            if (showAppbarLittleText)
              AppSliverPersistentCupertinoAppbar(
                trailings: trailings,
                leadings: leadings,
                title: title,
                barColor: barColor,
                user: user,
                notification: notification,
                back: back,
                onBack: onBack,
              ),
            if (!showAppbarLittleText)
              CustomCupertinoSliverNavigationBar(
                trailings: trailings,
                leadings: leadings,
                title: title,
                barColor: barColor,
                user: user,
                notification: notification,
                back: back,
                onBack: onBack,
              ),
            if (child != null)
              SliverList(
                // shrinkWrap: false,
                // physics: Physics.alwaysBounce,
                delegate: SliverChildListDelegate([child!]),
              ),
            if (slivers != null) ...slivers!
          ],
        ),
      ),
    );
  }
}
