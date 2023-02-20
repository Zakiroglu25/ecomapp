import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/physics.dart';

class SliverCaspaBar extends StatefulWidget {
  final List<Widget>? tabs;
  final List<Widget>? tabPages;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final RefreshCallback? onRefresh;
  final int? first;

  final bool? isScrollable;
  final Function(int)? tabController;

  const SliverCaspaBar({
    Key? key,
    this.tabs,
    this.tabPages,
    this.onRefresh,
    this.tabbarPadding,
    this.tabController,
    this.selectedTabColor,
    this.unSelectedLabelColor,
    this.isScrollable,
    this.first,
    this.selectedLabelColor,
  }) : super(key: key);

  @override
  State<SliverCaspaBar> createState() => _SliverCaspaBarState();
}

class _SliverCaspaBarState extends State<SliverCaspaBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs!.length);
    _tabController!.addListener(() {
      widget.tabController?.call(_tabController!.index);
    });

    if (widget.first != null && widget.first != -1) {
      _tabController!.animateTo(widget.first!);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabs!.length,
        child: NestedScrollView(
            physics: Physics.never,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
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
                      labelColor: widget.selectedLabelColor ?? MyColors.black,
                      unselectedLabelColor:
                          widget.unSelectedLabelColor ?? MyColors.grey153,
                      physics: Physics.alwaysBounce,
                      tabs: widget.tabs!,
                      //indicatorSize: TabBarIndicatorSize(),
                      isScrollable: widget.isScrollable ?? false,
                    ),
                  ),
                )
              ];
            },
            body: FadeIn(
              child: TabBarView(
                physics: Physics.alwaysBounce,
                controller: _tabController,
                children: widget.tabPages!.map((Widget child) {
                  return RefreshIndicator(
                      color: MyColors.brand,
                      onRefresh: () async => widget.onRefresh?.call(),
                      child: child);
                }).toList(),
              ),
            )));
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

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
