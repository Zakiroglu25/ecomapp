import 'package:uikit/presentation/page/cart_page/tabs/delivery_tab/delivery_tab.dart';
import 'package:uikit/presentation/page/cart_page/tabs/orders_tab/orders_tab.dart';
import 'package:uikit/presentation/page/cart_page/tabs/waiting_tab/waiting_tab.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<AppTab> tabs = [
    AppTab(
      text: MyText.orders,
      svg: Assets.bag_happy_xx,
      count: 5,
      index: 0,
    ),
    AppTab(
      text: MyText.in_waiting,
      svg: Assets.svgClock,
      count: 5,
      index: 1,
    ),
    AppTab(
      text: MyText.delivery,
      svg: Assets.truck_fast,
      count: 5,
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
        title: MyText.cart,
        isScrollable: true,
        tabPages: [
          OrdersTab(),
          WaitingTab(),
          DeliveryTab(),
        ],
        tabs: tabs);
  }
}
