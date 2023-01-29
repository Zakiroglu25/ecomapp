import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/delivery_orders/index.dart';
import 'package:uikit/infrastructure/cubit/tab_counts/index.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';

class DeliveryTab extends StatelessWidget {
  const DeliveryTab({Key? key}) : super(key: key);
  static const List products = [
    // CartOrderProduct(
    //   cartOrderType: CartOrderType.confirmed,
    // )
  ];
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () =>
          context.read<DeliveryOrdersCubit>().fetch(loading: false),
      child: BlocBuilder<DeliveryOrdersCubit, DeliveryOrdersState>(
        builder: (context, state) {
          if (state is DeliveryOrdersSuccess) {
            final orders = state.orders;
            return ListViewSeparated(
              padding: Paddings.paddingH16 + Paddings.paddingB200,
              shrinkWrap: true,
              physics: Physics.never,
              itemBuilder: (context, index) =>
                  CartOrderProduct(order: orders[index]),
              itemCount: orders.length,
            );
          } else if (state is DeliveryOrdersError) {
            return EmptyWidget(
              onRefresh: () => onRefresh(context),
            );
          } else {
            return AppLoading();
          }
        },
      ),
    );
  }

  void onRefresh(BuildContext context) {
    context.read<TabCountsCubit>().fetch(false);
    context.read<DeliveryOrdersCubit>().fetch();
  }
}
