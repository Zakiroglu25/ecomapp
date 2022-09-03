import 'package:doctoro/presentation/page/contact_page/contact_page.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:doctoro/widgets/main/cupperfold/cuppertabs.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/general/sliver_caspa_bar.dart';
import 'widgets/cart_product/cart_product.dart';
import 'widgets/cart_total_box/cart_total_box.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<Widget> tabs = [
    Tab(
      text: MyText.orders,
      height: 55,
    ),
    Tab(
      text: MyText.recipe,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CupperTabs(
        title: MyText.cart,
        tabPages: [
          Container(),
          Container(
            padding: Paddings.paddingA16,
            // color: MyColors.green,
            child: Center(
                child: ListView(
              shrinkWrap: true,
              physics: Physics.never,
              // space: 16,
              children: [
                CartProduct(),
                MySizedBox.h16,
                CartProduct(
                  recipeRequired: true,
                ),
                MySizedBox.h16,
                CartProduct(
                  recipeRequired: true,
                  url: MockData.recipeImgURL,
                ),
                MySizedBox.h16,
                CartTotalBox(),
              ],
            )),
          )
        ],
        tabs: tabs);
  }
}
