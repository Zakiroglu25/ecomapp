import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/orders_data.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/focusable_app_loading.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';

class OrdersStreamView extends StatelessWidget {
  const OrdersStreamView({Key? key, required this.orders, required this.cubit})
      : super(key: key);
  final dynamic cubit;
  final List<CartOrder> orders;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: cubit.haveElseStream,
        builder: (context, snapshot) {
          return ListViewSeparated(
              padding: Paddings.paddingH16 + Paddings.paddingB200,
              shrinkWrap: true,
              physics: Physics.never,
              itemBuilder: (context, index) => index == orders.length
                  ? FocusableAppLoading(onFocus: () => cubit.loadMore())
                  : CartOrderProduct(order: orders[index]),
              itemCount:
                  snapshot.data ?? false ? orders.length + 1 : orders.length);
        });
  }
}
