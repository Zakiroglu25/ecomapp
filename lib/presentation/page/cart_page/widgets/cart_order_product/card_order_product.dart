import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/model/response/orders_data.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/order_status.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/cart_order_utils.dart';
import 'package:uikit/utils/enums/delivery_type.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/row_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/black_box.dart';

import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../utils/delegate/pager.dart';
import 'widgets/c_o_p_order_button.dart';

class CartOrderProduct extends StatelessWidget {
  const CartOrderProduct({Key? key, required this.order}) : super(key: key);

  final CartOrder order;

  @override
  Widget build(BuildContext context) {
    final status = CartOrderUtils.cartOrderStatus(order.status!);
    return AppElementBox(
      onTap: () => Go.to(
          context,
          Pager.cartOrderDetails(order.guid!,
              orderNumber: order.orderNumber!, status: order.status!)),
      color: status.color,
      child: SpacedColumn(
          space: 6,
          padding: Paddings.paddingA8,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpacedRow(
              space: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(DeliveryType.toIconPath(order.deliveryType)),
                BlackBox(DeliveryType.toAzText(order.deliveryType))
                // DotsButton(
                //     controller: CustomPopupMenuController(),
                //     menuBuilder: () {
                //       return nil;
                //     })
              ],
            ),
            Text(
              "${MyText.package} ${order.orderNumber}",
              style: AppTextStyles.sfPro600.copyWith(fontSize: 16),
            ),
            MySizedBox.h2,
            SpacedRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${MyText.countOfMedicine}: ${order.totalStockItemsOrdered}',
                    style: AppTextStyles.sfPro500s13,
                  ),
                  Text(
                    '${MyText.orderDate}: ${order.createdAt.formatDateTimeFromUtc}',
                    style: AppTextStyles.sfPro500s13,
                  ),
                ]),
            SpacedRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  order.totalPrice.toManat13(title: MyText.price),
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
                        SvgPicture.asset(
                          status.statusIcon,
                          color: status.statusIconColor,
                        ),
                        MySizedBox.w8,
                        Flexible(
                          child: Text(
                            status.text,
                            style: AppTextStyles.sfPro500
                                .copyWith(color: status.color.toTextColor),
                            //  overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]),
                ),
              ],
            ),
            MySizedBox.h8,
            if (order.status == OrderStatus.PENDING_PAYMENT ||
                order.status == OrderStatus.APPROVED)
              COPOrderButton(
                  orderGuid: order.guid!, deliveryType: order.deliveryType!)
          ]),
    );
  }
}
