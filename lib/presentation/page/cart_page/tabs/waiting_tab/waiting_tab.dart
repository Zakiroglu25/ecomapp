import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/utils/enums/cart_order_type.dart';
import 'package:uikit/utils/extensions/context.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';

class WaitingTab extends StatelessWidget {
  const WaitingTab({Key? key}) : super(key: key);

  static const _elementList = [
    CartOrderProduct(
      cartOrderType: CartOrderType.waiting,
    ),
    CartOrderProduct(
      cartOrderType: CartOrderType.waitingPayment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ListviewSeparated(
          padding: Paddings.paddingH16 + Paddings.paddingB200,
          shrinkWrap: true,
          physics: Physics.never,
          itemBuilder: (context, index) {
            return _elementList[index];
          },
          itemCount: _elementList.length,
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.end,
              space: 10,
              children: [
                AppButton.black(
                  w: context.dynamicW(.4),
                  text: MyText.keepInTouchX,
                ),
                AppButton.black(
                  w: context.dynamicW(.5),
                  text: MyText.orderDeliveryX,
                  onTap: () => Go.to(context, Pager.cartDelivery),
                ),
              ],
            ))
      ],
    );
  }
}
