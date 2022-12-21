import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_product/cart_product.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/cart_total_box.dart';
import 'package:uikit/utils/constants/mock.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';

import '../../../../../widgets/custom/listview_separated.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);
  // static const List products = [
  //   const CartProduct(),
  //   const CartProduct(
  //     recipeRequired: true,
  //   ),
  //   const CartProduct(
  //     recipeRequired: true,
  //     url: MockData.recipeImgURL,
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bbbb("stateee:   ${state} ");
        if (state is CartFetched) {
          final items = state.items;
          return ListView(
            children: [
              ListViewSeparated(
                shrinkWrap: true,
                physics: Physics.never,
                // space: 16,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final currentItem = items[index];
                  return CartProduct(item: currentItem);
                },
              ),
              MySizedBox.h16,
              const CartTotalBox(),
            ],
          );
        } else if (state is CartInProgress) {
          return AppLoading();
        } else {
          return EmptyWidget();
        }
      },
    ));
  }
}
