import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wrapper.dart';
import 'widgets/cart_product/cart_product.dart';
import 'widgets/cart_total_box/cart_total_box.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<AppTab> tabs = [
    AppTab(
      text: MyText.orders,
      svg: Assets.bag_happy,
      count: 5,
      index: 0,
    ),
    AppTab(
      text: MyText.in_waiting,
      svg: Assets.clock,
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
    return CupperTabWrapper(
        title: MyText.cart,
        isScrollable: true,
        tabPages: [
          Container(
            padding: Paddings.paddingH16,
            // color: MyColors.green,
            child: Center(
                child: ListView(
              shrinkWrap: true,
              physics: Physics.never,
              // space: 16,
              children: [
                const CartProduct(),
                MySizedBox.h16,
                const CartProduct(
                  recipeRequired: true,
                ),
                MySizedBox.h16,
                const CartProduct(
                  recipeRequired: true,
                  url: MockData.recipeImgURL,
                ),
                MySizedBox.h16,
                const CartTotalBox(),
              ],
            )),
          ),
          Container(),
          Container(),
        ],
        tabs: tabs);
  }
}
