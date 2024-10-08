import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/extensions/object.dart';
import 'package:uikit/widgets/main/cupperfold/widgets/custom_cupertino_sliver_navigation_bar.dart';

import '../../../utils/constants/physics.dart';
import '../../custom/app_tab.dart';
import '../cupperfold/widgets/app_sliver_persistent_cupertino_appbar.dart';
import 'cupper_tab_wp.dart';
import 'cuppertabs_provider.dart';

class CupperTabsWithProvider extends StatefulWidget {
  const CupperTabsWithProvider({
    Key? key,
    this.child,
    this.title,
    this.leadings,
    this.trailings,
    this.back = true,
    this.onBack,
    this.physics = Physics.alwaysBounce,
    this.tabController,
    this.headers,
    this.isScrollable = false,
    this.first = 0,
    required this.tabs,
    required this.tabPages,
    this.tabbarPadding,
    this.onChange,
    this.onIndexCompletelyChanged,
    this.selectedLabelColor,
    this.selectedTabColor,
    this.barColor,
    this.showAppbarLittleText = true,
    this.withCupertinoAppbar = true,
    this.unSelectedLabelColor,
    this.onRefresh,
    this.tabbarTitle,
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
  final bool? back;
  final bool showAppbarLittleText;
  //onChange olduqda sorgular tekraralana biler
  //ona gore onIndexCompletylChanged istifade olunmalidir
  final OnTabChanged? onChange;
  final OnTabChanged? onIndexCompletelyChanged;
  final bool withCupertinoAppbar;
  final bool isScrollable;
  final Function? onBack;
  final List<AppTab> tabs;
  final List<Widget> tabPages;
  final SliverPersistentHeader? headers;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final SliverPersistentHeaderDelegate? tabbarTitle;
  final Color? barColor;
  final RefreshCallback? onRefresh;
  final ScrollPhysics physics;
  final Function(int)? tabController;

  @override
  State<CupperTabsWithProvider> createState() => _CupperTabsWithProviderState();
}

class _CupperTabsWithProviderState extends State<CupperTabsWithProvider>
    with SingleTickerProviderStateMixin {
  // late List<AppTab> tabs;

  late TabController _tabController;
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  tabs = widget.tabs;
    _tabController = TabController(vsync: this, length: widget.tabs.length);

    _tabController.animation?.addListener(() {
      widget.tabController?.call(_tabController.index);
      int _currentIndex = (_tabController.animation?.value)!
          .round(); //_tabController.animation.value returns double
      Provider.of<CupperProvider>(context, listen: false)
          .changeTab(widget.tabs[_currentIndex]);

      if (_tabController.indexIsChanging) {
        widget.onChange?.call(_currentIndex);
      }
      if (_tabController.index != index) {
        index = _tabController.index;
        widget.onIndexCompletelyChanged?.call(index);
      }
      setState(() {});
    });

    if (widget.first.isNotNull && widget.first != -1) {
      _tabController.animateTo(widget.first!);
      index = widget.first!;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bbbb('coooo: ${Provider.of<CupperProvider>(context, listen: true).color}');
    return Scaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Consumer<CupperProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return DefaultTabController(
              length: widget.tabs.length,
              child: NestedScrollView(
                  floatHeaderSlivers: true,
                  physics: Physics.never,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      // if (!widget.withCupertinoAppbar)
                      //   DoctorAppbar(
                      //     contextA: context,
                      //     user: widget.user,
                      //     title: widget.title,
                      //   ),
                      if (widget.showAppbarLittleText)
                        AppSliverPersistentCupertinoAppbar(
                          trailings: widget.trailings,
                          leadings: widget.leadings,
                          title: widget.title,
                          barColor: widget.barColor,
                          user: widget.user,
                          notification: widget.notification,
                          back: widget.back,
                          onBack: widget.onBack,
                        ),
                      if (!widget.showAppbarLittleText)
                        CustomCupertinoSliverNavigationBar(
                          trailings: widget.trailings,
                          leadings: widget.leadings,
                          title: widget.title,
                          barColor: widget.barColor,
                          user: widget.user,
                          notification: widget.notification,
                          back: widget.back,
                          onBack: widget.onBack,
                        ),
                      if (widget.headers != null) widget.headers!,
                      if (widget.tabbarTitle != null)
                        SliverPersistentHeader(
                            floating: false,
                            pinned: true,
                            delegate: widget.tabbarTitle!),
                      SliverPersistentHeader(
                          floating: false,
                          pinned: true,
                          delegate: _SliverAppBarDelegate(TabBar(
                            padding: widget.tabbarPadding ??
                                const EdgeInsets.only(
                                    left: 20, right: 20, top: 5, bottom: 10),
                            controller: _tabController,
                            indicatorColor: MyColors.green235,
                            overlayColor:
                                MaterialStateProperty.all(Colors.black),

                            indicator: BoxDecoration(
                              borderRadius: Radiuses.r36,
                              color:
                                  widget.selectedTabColor ?? MyColors.secondary,
                            ),

                            labelColor:
                                widget.selectedLabelColor ?? MyColors.brand,
                            unselectedLabelColor:
                                widget.unSelectedLabelColor ?? MyColors.grey158,
                            physics: Physics.alwaysBounce,
                            tabs: Provider.of<CupperProvider>(context,
                                    listen: true)
                                .tabs,
                            //indicatorSize: TabBarIndicatorSize(),
                            isScrollable: widget.isScrollable,
                          )))
                    ];
                  },
                  body: TabBarView(
                    physics: widget.physics,
                    controller: _tabController,
                    children: widget.tabPages.map((Widget child) {
                      return RefreshIndicator(
                          color: MyColors.brand,
                          onRefresh: () async => widget.onRefresh?.call(),
                          child: child);
                    }).toList(),
                  )),
            );
          },
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
      height: 99,
      color: Colors.white,
      child: _tabBar,
    );
  }

  //test

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
