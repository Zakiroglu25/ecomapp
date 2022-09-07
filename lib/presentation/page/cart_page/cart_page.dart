import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/utils/enums/cart_order_type.dart';
import 'package:doctoro/utils/extensions/word.dart';
import 'package:doctoro/widgets/custom/doctoro_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/custom/column_with_space.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wrapper.dart';
import 'widgets/cart_order_product/card_order_product.dart';
import 'widgets/cart_product/cart_product.dart';
import 'widgets/cart_total_box/cart_total_box.dart';

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
          Stack(
            children: [
              ListView(
                padding: Paddings.paddingH16,
                children: [
                  CartOrderProduct(
                    cartOrderType: CartOrderType.waiting,
                  ),
                  CartOrderProduct(
                    cartOrderType: CartOrderType.waitingPayment,
                  ),
                  CartOrderProduct(
                    cartOrderType: CartOrderType.confirmed,
                  ),
                ],
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: SpacedColumn(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    space: 10,
                    children: [
                      AppButton.black(
                        w: MediaQuery.of(context).size.width / 2.5,
                        text: MyText.keepInTouchX.withX("☎"),
                      ),
                      AppButton.black(
                        w: MediaQuery.of(context).size.width / 2,
                        text: MyText.orderDeliveryX.withX("🚚"),
                      ),
                    ],
                  ))
            ],
          ),
          Container(),
        ],
        tabs: tabs);
  }
}
