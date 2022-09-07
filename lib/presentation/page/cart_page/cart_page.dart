import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/custom/dots_button.dart';
import 'package:doctoro/widgets/custom/row_with_space.dart';
import 'package:doctoro/widgets/general/app_element_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nil/nil.dart';

import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wrapper.dart';
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
          ListView(
            padding: Paddings.paddingH16,
            children: [
              AppElementBox(
                child: SpacedColumn(
                    space: 6,
                    padding: Paddings.paddingA8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(Assets.svgShoppingCart),
                          DotsButton(
                              controller: CustomPopupMenuController(),
                              menuBuilder: () {
                                return nil;
                              })
                        ],
                      ),
                      Text(
                        "Baglama 001",
                        style: AppTextStyles.sfPro600.copyWith(fontSize: 16),
                      ),
                      MySizedBox.h2,
                      SpacedRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dərman sayı: 5',
                              style: AppTextStyles.sfPro500s13,
                            ),
                            Text(
                              'Sifariş tarixi: 27.08.2022',
                              style: AppTextStyles.sfPro500s13,
                            ),
                          ]),
                      SpacedRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Qiymət: 64.00 ₼',
                              style: AppTextStyles.sfPro500s13,
                            ),
                          ]),
                      MySizedBox.h14,
                      SpacedRow(
                          space: 12,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(Assets.svgClock),
                            Text(
                              'Resept aptek tərəfindən dəyərləndirilir',
                              style: AppTextStyles.sfPro500,
                            )
                          ])
                    ]),
              )
            ],
          ),
          Container(),
        ],
        tabs: tabs);
  }
}
