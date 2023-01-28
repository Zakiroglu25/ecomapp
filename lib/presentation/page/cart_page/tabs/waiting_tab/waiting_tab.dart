import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_cubit.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';

import '../../../../../infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import '../../../../../utils/constants/assets.dart';
import '../../../../../widgets/general/app_loading.dart';
import '../../../../../widgets/general/empty_widget.dart';
import '../../../../../widgets/general/list_or_empty.dart';

class WaitingTab extends StatelessWidget {
  const WaitingTab({Key? key}) : super(key: key);

  // static const _elementList = [
  //   CartOrderProduct(
  //     cartOrderType: CartOrderType.waiting,
  //   ),
  //   CartOrderProduct(
  //     cartOrderType: CartOrderType.waitingPayment,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () =>
          context.read<WaitingOrdersCubit>().fetch(loading: false),
      child: BlocBuilder<WaitingOrdersCubit, WaitingOrdersState>(
        builder: (context, state) {
          bbbb("stateee:   $state");
          if (state is WaitingOrdersSuccess) {
            final orders = state.orders;
            return ListViewSeparated(
              padding: Paddings.paddingH16 + Paddings.paddingB200,
              shrinkWrap: true,
              physics: Physics.never,
              itemBuilder: (context, index) =>
                  CartOrderProduct(order: orders[index]),
              itemCount: orders.length,
            );
          } else if (state is WaitingOrdersError) {
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
    context.read<WaitingOrdersCubit>().fetch();
  }
}
