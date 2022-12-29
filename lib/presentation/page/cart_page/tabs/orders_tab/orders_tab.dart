import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_state.dart';
import 'package:uikit/infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_product/cart_product.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/cart_total_box.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';

import '../../../../../widgets/custom/listview_separated.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocConsumer<CartCubit, CartState>(
      listener: (_, state) {
        if (state is CartOperationError) Snack.display(message: MyText.error);
      },
      buildWhen: (_, state) {
        if (state is CartOperationError) return false;
        return true;
      },
      builder: (context, state) {
        if (state is CartFetched) {
          final items = state.cartInfo!.items!.reversed.toList();
          return ListOrEmpty(
            list: items,
            onRefresh: () => onRefresh(context),
            image: Assets.pngEmptyCart,
            text: MyText.cartIsEmpty,
            description: MyText.goToProductSectionToFindProducts,
            child: ListView(
              children: [
                ListViewSeparated(
                  shrinkWrap: true,
                  physics: Physics.never,
                  // space: 16,
                  itemCount: items.length,
                  itemBuilder: (context, index) =>
                      CartProduct(item: items[index]),
                ),
                MySizedBox.h16,
                CartTotalBox(cartInfo: state.cartInfo),
              ],
            ),
          );
        } else if (state is CartInProgress) {
          return AppLoading();
        } else {
          return EmptyWidget(
            onRefresh: () => onRefresh(context),
          );
        }
      },
    ));
  }

  void onRefresh(BuildContext context) {
    context.read<TabCountsCubit>().fetch(false);
    context.read<CartCubit>().fetch();
  }
}
