import 'package:doctoro/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/physics.dart';
import 'widgets/custom_cupertino_sliver_navigation_bar.dart';

class CupperTabs extends StatefulWidget {
  const CupperTabs({
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
  final List<Widget> tabs;
  final List<Widget> tabPages;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final RefreshCallback? onRefresh;
  final Function(int)? tabController;

  @override
  State<CupperTabs> createState() => _CupperTabsState();
}

class _CupperTabsState extends State<CupperTabs>
    with SingleTickerProviderStateMixin {
  late List<Widget> tabs;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = widget.tabs;
    _tabController = TabController(vsync: this, length: widget.tabs.length);
    _tabController.addListener(() {
      widget.tabController?.call(_tabController.index);
    });

    if (widget.first != -1) {
      _tabController.animateTo(widget.first);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // A ScrollView that creates custom scroll effects using slivers.
        backgroundColor: MyColors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: tabs.length,
            child: NestedScrollView(
                physics: Physics.never,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    CustomCupertinoSliverNavigationBar(
                      trailings: widget.trailings,
                      leadings: widget.leadings,
                      title: widget.title,
                      user: widget.user,
                      notification: widget.notification,
                      back: widget.back,
                      onBack: widget.onBack,
                    ),
                    SliverPersistentHeader(
                        floating: false,
                        pinned: true,
                        delegate: _SliverAppBarDelegate(TabBar(
                          padding: widget.tabbarPadding ??
                              const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 10),
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            color: widget.selectedTabColor ?? MyColors.mainGrey,
                          ),
                          labelColor:
                              widget.selectedLabelColor ?? MyColors.black,
                          unselectedLabelColor:
                              widget.unSelectedLabelColor ?? MyColors.grey153,
                          physics: Physics.alwaysBounce,
                          tabs: tabs,
                          //indicatorSize: TabBarIndicatorSize(),
                          isScrollable: widget.isScrollable,
                        )))
                  ];
                },
                body: TabBarView(
                  physics: Physics.alwaysBounce,
                  controller: _tabController,
                  children: widget.tabPages!.map((Widget child) {
                    return RefreshIndicator(
                        color: MyColors.main,
                        onRefresh: () async => widget.onRefresh?.call(),
                        child: child);
                  }).toList(),
                )),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  //test

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
