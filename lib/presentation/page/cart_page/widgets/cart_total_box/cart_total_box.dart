import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import '../../../../../infrastructure/model/response/cart_items.dart';
import '../../../../../widgets/general/app_element_box.dart';
import 'widgets/cart_delivery_price.dart';
import 'widgets/cart_insurance_info.dart';
import 'widgets/cart_insurance_switch.dart';
import 'widgets/cart_make_order_button.dart';
import 'widgets/cart_total_recipe.dart';
import 'widgets/order_price.dart';

class CartTotalBox extends StatelessWidget {
  const CartTotalBox({Key? key, required this.cartInfo}) : super(key: key);
  final CartInfo? cartInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: AppElementBox(
        child: SpacedColumn(space: 20, children: [
          CartOrdersPrice(cartInfo?.totalOrderPrice),
          CartDeliveryPrice(cartInfo?.totalDeliveryPrice),
          CartTotalPrice(cartInfo?.totalPrice),
          // CartInsuranceInfo(),
          // CartInsuranceSwitch(),
          // CartTotalRecipe(
          //   url: '',
          //   cartGuid: '',
          // ),
          CartMakeOrderButton()
        ]),
      ),
    );
  }
}
