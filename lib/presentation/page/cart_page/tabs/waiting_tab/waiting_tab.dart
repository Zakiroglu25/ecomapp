import 'package:doctoro/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/utils/delegate/navigate_utils.dart';
import 'package:doctoro/utils/delegate/pager.dart';
import 'package:doctoro/utils/enums/cart_order_type.dart';
import 'package:doctoro/utils/extensions/context.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/custom/app_button.dart';
import 'package:doctoro/widgets/custom/listview_separated.dart';
import 'package:flutter/material.dart';

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
