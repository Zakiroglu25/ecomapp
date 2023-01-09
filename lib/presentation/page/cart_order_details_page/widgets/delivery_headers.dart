import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/order_info/index.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_call_and_messenger_b_uttons.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_med_count.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_order_date.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_recipe.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_total_price.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/cart_order_utils.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/sliver_app_bar_delegate.dart';
import 'package:uikit/widgets/general/app_loading.dart';

class DeliveryHeaders extends StatelessWidget {
  const DeliveryHeaders({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: false,
        pinned: false,
        delegate: SliverAppDelegate(
            child: Container(
              color: CartOrderUtils.cartOrderStatus(status).color,
              // height: 90,
              child: BlocBuilder<OrderInfoCubit, OrderInfoState>(
                builder: (context, state) {
                  if (state is OrderInfoSuccess) {
                    final order = state.orderDetails;
                    final orderedItems = order.orderedItems;
                    return FittedBox(
                      fit: BoxFit.contain,
                      child: SpacedColumn(
                        space: 12,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MySizedBox.h16,
                          DeliveryMedCount(count: orderedItems!.length),
                          DeliveryTotalPrice(price: order.totalPrice),
                          DeliveryOrderDate(date: order.createdAt),
                          DeliveryRecipe(),
                          MySizedBox.h8,
                          DeliveryCallAndMessengerButtons(
                              storeGuid: order.storeGuid,
                              storeName: order.storeName,
                              storePhone: order.storePhone),
                          MySizedBox.h8,
                        ],
                      ),
                    );
                  } else if (state is OrderInfoError) {
                    return Container();
                  } else {
                    return AppLoading();
                  }
                },
              ),
            ),
            maxExtent_: 290));
  }
}
