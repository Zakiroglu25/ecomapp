import 'package:doctoro/widgets/custom/app_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cuppertabs_provider.dart';
import 'cuppertabs_wp.dart';

class CupperTabWrapper extends StatelessWidget {
  const CupperTabWrapper({
    Key? key,
    this.child,
    this.title,
    this.leadings,
    this.trailings,
    this.back = true,
    this.onBack,
    this.tabController,
    this.isScrollable = false,
    this.first = 0,
    required this.tabs,
    required this.tabPages,
    this.tabbarPadding,
    this.selectedLabelColor,
    this.selectedTabColor,
    this.unSelectedLabelColor,
    this.onRefresh,
    this.user = true,
    this.notification = true,
  }) : super(key: key);

  final Widget? child;
  final String? title;
  final int first;
  final List<Widget>? leadings;
  final List<Widget>? trailings;
  final bool? user;
  final bool? notification;
  final bool? back;
  final bool isScrollable;
  final Function? onBack;
  final List<AppTab> tabs;
  final List<Widget> tabPages;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final RefreshCallback? onRefresh;
  final Function(int)? tabController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:
          //(c) =>
          CupperProvider()..configAppTab(initialTabs: tabs, first: first),
      child: CupperTabsWp(
          title: title,
          isScrollable: isScrollable,
          tabPages: tabPages,
          tabs: tabs,
          child: child,
          first: first,
          leadings: leadings,
          trailings: trailings,
          user: user,
          notification: notification,
          back: back,
          onBack: onBack,
          tabbarPadding: tabbarPadding,
          selectedTabColor: selectedTabColor,
          selectedLabelColor: selectedLabelColor,
          unSelectedLabelColor: unSelectedLabelColor,
          onRefresh: onRefresh,
          tabController: tabController),
    );
  }
}
