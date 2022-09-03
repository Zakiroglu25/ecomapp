import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:doctoro/widgets/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/paddings.dart';
import 'widget/fovorite_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(vsync: this, length: 2, initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: true,
        notification: true,
        contextA: context,
        title: MyText.favorite,
        filter: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MySizedBox.h26,
            Container(
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                indicatorWeight: 0.01,
                unselectedLabelColor:
                    Theme.of(context).textTheme.headline1!.color,
                labelColor: MyColors.mainRED,
                onTap: (index) => setState(() => _selectedIndex = index),
                tabs: List<Widget>.generate(
                  _controller!.length,
                  (index) => Tab(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == _selectedIndex
                            ? MyColors.red250
                            : MyColors.grey245,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            index == 0
                                ? SvgPicture.asset(
                                    Assets.svgFav,
                                    color: _selectedIndex == 0
                                        ? MyColors.mainRED
                                        : MyColors.grey158,
                                  )
                                : SvgPicture.asset(
                                    Assets.docu,
                                    color: _selectedIndex == 1
                                        ? MyColors.mainRED
                                        : MyColors.grey158,
                                  ),
                            MySizedBox.w10,
                            index == 0
                                ? Text(MyText.favorite)
                                : Text("Ödəniş şablonlar")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: _controller, children: [
                Padding(
                  padding: Paddings.paddingH16,
                  child: ListView(
                    children: [
                      ListItemWidget(),
                    ],
                  ),
                ),
                EmptyWidget(
                  color: MyColors.red249,
                  imageUrl: Assets.location3x,
                  description: MyText.demoSubtitle,
                  text: MyText.demo,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
