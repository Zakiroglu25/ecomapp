import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_cubit.dart';
import 'package:uikit/infrastructure/cubit/waiting_orders/waiting_orders_state.dart';
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

import '../../../../../infrastructure/cubit/cart/cart_cubit.dart';
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
    return Stack(
      fit: StackFit.expand,
      children: [
        BlocBuilder<WaitingOrdersCubit, WaitingOrdersState>(
          builder: (context, state) {
            if (state is WaitingOrdersSuccess) {
              final orders = state.orders;
              return ListOrEmpty(
                list: orders,
                onRefresh: () => onRefresh(context),
                image: Assets.pngEmptyCart,
                text: MyText.cartIsEmpty,
                description: MyText.goToProductSectionToFindProducts,
                child: ListViewSeparated(
                  padding: Paddings.paddingH16 + Paddings.paddingB200,
                  shrinkWrap: true,
                  physics: Physics.never,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return CartOrderProduct(
                      order: order,
                      cartOrderType: CartOrderType.waiting,
                    );
                  },
                  itemCount: orders.length,
                ),
              );
            } else if (state is WaitingOrdersInProgress) {
              return AppLoading();
            } else {
              return EmptyWidget(
                onRefresh: () => onRefresh(context),
              );
            }
          },
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
                  // onTap: () => Go.to(context, Pager.cartDelivery),
                ),
              ],
            ))
      ],
    );
  }

  void onRefresh(BuildContext context) {
    context.read<TabCountsCubit>().fetch(false);
    context.read<WaitingOrdersCubit>().fetch();
  }
}
