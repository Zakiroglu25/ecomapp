import 'package:doctoro/util/constants/assets.dart';
import 'package:doctoro/util/constants/colors.dart';
import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/util/constants/text.dart';
import 'package:doctoro/widget/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widget/tabbar_widget.dart';

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
  void dispose() {
    super.dispose();

    _controller!.dispose();
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
                labelColor: MyColors.mainRed,
                onTap: (index) => setState(() => _selectedIndex = index),
                tabs: List<Widget>.generate(_controller!.length, (index) {
                  print("index" + index.toString());
                  print("_selectedIndex" + _selectedIndex.toString());
                  return Tab(
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
                                        ? MyColors.mainRed
                                        : MyColors.grey158,
                                  )
                                : SvgPicture.asset(
                                    Assets.docu,
                                    color: _selectedIndex == 1
                                        ? MyColors.mainRed
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
                  );
                }),
              ),
            ),
            FavTabbarWidget(controller: _controller),
          ],
        ),
      ),
    );
  }
}

