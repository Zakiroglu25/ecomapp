import 'package:doctoro/presentation/page/favorite_page/favorite_page.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentation/page/home_page/home_page.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/physics.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/pager.dart';

final globalPageController = PageController(initialPage: 1);

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int index = 0;

  final pages = <Widget>[
    Pager.productPage,
    FavoritePage(),
    Pager.home,
    Pager.cart,
    Pager.otherPage,
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => PageView(
        controller: globalPageController,
        physics: Physics.alwaysClamp,
        children: [
          // Pager.userCabinet(showBack: true), //
          Scaffold(
            key: _key,
            extendBody: true,
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
              // activeColor: MyColors.mainColor,
              backgroundColor: Colors.white,
              //elevation: 10,
              elevation: 0,
              unselectedFontSize: 11,
              selectedFontSize: 11,
              selectedLabelStyle:
                  AppTextStyles.sfPro500.copyWith(color: MyColors.black),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: MyColors.black34,
              items: [
                buildBottomNavigationBarItem(
                    icon: Assets.svgLogo, label: MyText.product),
                buildBottomNavigationBarItem(
                    icon: Assets.svgFav, label: MyText.favorite),
                buildBottomNavigationBarItem(
                    icon: Assets.svgAptek, label: MyText.aptek),
                buildBottomNavigationBarItem(
                    icon: Assets.svgCart, label: MyText.cart),
                buildBottomNavigationBarItem(
                    icon: Assets.svgMore, label: MyText.other),
              ],
              currentIndex: index,
              onTap: onChangedTab,
              // selectedItemColor: MyColors.black,
            ),
          )
        ],
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      activeIcon: SvgPicture.asset(
        icon,
        color: index == 2 ? MyColors.green : MyColors.darkRED,
      ),
      icon: SvgPicture.asset(icon),
      label: label,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
