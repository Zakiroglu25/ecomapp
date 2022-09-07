import 'package:doctoro/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_cupertino_sliver_navigation_bar.dart';

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
    return Scaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: CustomScrollView(
          clipBehavior: Clip.antiAlias,
          // A list of sliver widgets.
          slivers: <Widget>[
            CustomCupertinoSliverNavigationBar(
              trailings: trailings,
              leadings: leadings,
              title: title,
              user: user,
              notification: notification,
              back: back,
              onBack: onBack,
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
    );
  }
}
