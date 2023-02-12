import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_cubit.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_order_product/card_order_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/focusable_app_loading.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/pagenatible.dart';

import '../../../../../infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import '../../../../../widgets/general/app_loading.dart';
import '../../../../../widgets/general/empty_widget.dart';
import 'widgets/orders_stream_view.dart';

class WaitingTab extends StatelessWidget {
  const WaitingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WaitingOrdersCubit>(context);
    return FocusDetector(
      onFocusGained: () =>
          context.read<WaitingOrdersCubit>().fetch(loading: false),
      child: BlocBuilder<WaitingOrdersCubit, WaitingOrdersState>(
        builder: (context, state) {
          if (state is WaitingOrdersSuccess) {
            final orders = state.orders;
            return OrdersStreamView(
              orders: orders,
              cubit: cubit,
              key: Key("waitings"),
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
