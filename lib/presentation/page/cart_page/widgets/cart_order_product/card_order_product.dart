import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/model/response/orders_data.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/enums/cart_order_type.dart';
import 'package:uikit/utils/extensions/word.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/dots_button.dart';
import 'package:uikit/widgets/custom/row_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../utils/delegate/pager.dart';

class CartOrderProduct extends StatelessWidget {
  const CartOrderProduct(
      {Key? key, required this.cartOrderType, required this.order})
      : super(key: key);
  final CartOrderType cartOrderType;
  final CartOrder order;
  @override
  Widget build(BuildContext context) {
    return AppElementBox(
      onTap: () => Go.to(context, Pager.cartDelivery(order.guid!)),
      color: CartOrderType.color(cartOrderType),
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
                // DotsButton(
                //     controller: CustomPopupMenuController(),
                //     menuBuilder: () {
                //       return nil;
                //     })
              ],
            ),
            Text(
              "Baglama ${order.guid}",
              style: AppTextStyles.sfPro600.copyWith(fontSize: 16),
            ),
            MySizedBox.h2,
            SpacedRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dərman sayı: ',
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
                    'Qiymət: ${order.totalPrice} ₼',
                    style: AppTextStyles.sfPro500s13,
                  ),
                ]),
            MySizedBox.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                      // space: 12,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.svgClock),
                        MySizedBox.w8,
                        Flexible(
                          child: Text(
                            CartOrderType.stText(cartOrderType),
                            style: AppTextStyles.sfPro500,
                            //  overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]),
                ),
                WidgetOrEmpty(
                  value: cartOrderType == CartOrderType.waitingPayment,
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: Paddings.paddingL8,
                      child: AppButton.black(
                        h: 36,
                        text: MyText.pay.withPrice(999.999),
                        // w: 140,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
