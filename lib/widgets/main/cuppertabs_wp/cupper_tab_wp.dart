import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/app_tab.dart';

import 'cuppertabs_provider.dart';
import 'cuppertabs_wp.dart';

typedef OnTabChanged = void Function(int index);

class CupperTabWP extends StatelessWidget {
  const CupperTabWP({
    Key? key,
    this.child,
    this.title,
    this.leadings,
    this.trailings,
    this.back = true,
    this.onBack,
    this.tabController,
    this.isScrollable = false,
    this.first,
    required this.tabs,
    required this.tabPages,
    this.tabbarPadding,
    this.tabbarTitle,
    this.onChange,
    this.selectedLabelColor,
    this.selectedTabColor,
    this.showAppbarLittleText = false,
    this.withCupertinoAppbar = true,
    this.unSelectedLabelColor,
    this.headers,
    this.onRefresh,
    this.physics = Physics.alwaysBounce,
    this.user = true,
    this.notification = true,
  }) : super(key: key);

  final Widget? child;
  final String? title;
  final int? first;
  final List<Widget>? leadings;
  final List<Widget>? trailings;
  final bool? user;
  final bool? notification;
  final bool withCupertinoAppbar;
  final bool? back;
  final bool isScrollable;
  final bool showAppbarLittleText;
  final SliverPersistentHeader? headers;
  final Function? onBack;
  final OnTabChanged? onChange;
  final List<AppTab> tabs;
  final List<Widget> tabPages;
  final SliverPersistentHeaderDelegate? tabbarTitle;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final RefreshCallback? onRefresh;
  final ScrollPhysics physics;
  final Function(int)? tabController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:
          //(c) =>
          CupperProvider()..configAppTab(initialTabs: tabs, first: first),
      child: CupperTabsWithProvider(
          title: title,
          withCupertinoAppbar: withCupertinoAppbar,
          isScrollable: isScrollable,
          tabPages: tabPages,
          tabs: tabs,
          child: child,
          first: first,
          onChange: onChange,
          physics: physics,
          tabbarTitle: tabbarTitle,
          leadings: leadings,
          trailings: trailings,
          user: user,
          headers: headers,
          notification: notification,
          back: back,
          onBack: onBack,
          showAppbarLittleText: showAppbarLittleText,
          tabbarPadding: tabbarPadding,
          selectedTabColor: selectedTabColor,
          selectedLabelColor: selectedLabelColor,
          unSelectedLabelColor: unSelectedLabelColor,
          onRefresh: onRefresh,
          tabController: tabController),
    );
  }
}
