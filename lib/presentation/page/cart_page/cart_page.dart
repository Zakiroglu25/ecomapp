import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import 'package:uikit/infrastructure/cubit/tab_counts/tab_counts_state.dart';
import 'package:uikit/presentation/page/cart_page/tabs/delivery_tab/delivery_tab.dart';
import 'package:uikit/presentation/page/cart_page/tabs/orders_tab/orders_tab.dart';
import 'package:uikit/presentation/page/cart_page/tabs/waiting_tab/waiting_tab.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCountsCubit, TabCountsState>(
        builder: (context, state) {
      int? inCart;
      int? inProcessing;
      int? inDelivery;
      if (state is TabCountsSuccess) {
        inCart = state.tabCounts?.inCart;
        inProcessing = state.tabCounts?.inProcessing;
        inDelivery = state.tabCounts?.inDelivery;
      }
      return CupperTabWP(
          title: MyText.cart,
          isScrollable: true,
          onChange: (index) {
            // context.read<WaitingOrdersCubit>().fetch();
            context.read<TabCountsCubit>().setCurrentTab(index);
          },
          onIndexCompletelyChanged: (index) {
            context.read<CartCubit>().fetch(false);
            // context.read<WaitingOrdersCubit>().fetch();
            context.read<TabCountsCubit>().fetch(false);
          },
          onRefresh: () {
            context.read<CartCubit>().fetch();
            // context.read<WaitingOrdersCubit>().fetch();
            return context.read<TabCountsCubit>().fetch(false);
          },
          tabPages: [
            OrdersTab(),
            WaitingTab(),
            DeliveryTab(),
          ],
          first: context.watch<TabCountsCubit>().currentTab,
          tabs: [
            AppTab(
              text: MyText.orders,
              svg: Assets.bag_happy_xx,
              count: inCart,
              index: 0,
            ),
            AppTab(
              text: MyText.in_waiting,
              svg: Assets.svgClock,
              count: inProcessing,
              index: 1,
            ),
            AppTab(
              text: MyText.delivery,
              svg: Assets.truck_fast,
              count: inDelivery,
              index: 2,
            ),
          ]);
    });
  }
}
