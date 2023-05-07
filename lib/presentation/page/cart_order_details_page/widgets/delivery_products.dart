import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/order_info/index.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_product.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../../widgets/general/app_loading.dart';

class DeliveryProducts extends StatelessWidget {
  const DeliveryProducts({Key? key,required this.scrollController}) : super(key: key);
final ScrollController scrollController;
  // static const List<Widget> products = [
  //   DeliveryProduct(),
  //   DeliveryProduct(
  //     insuranceCover: false,
  //   ),
  //   DeliveryProduct(),
  // ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Radiuses.r36,
      child: Container(
        padding: Paddings.paddingH16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Radiuses.r36,
        ),
        child: BlocBuilder<OrderInfoCubit, OrderInfoState>(
          builder: (context, state) {
            if (state is OrderInfoSuccess) {
              final orderInfo = state.orderDetails;
              final orderedItems = orderInfo.orderedItems;
              return ListViewSeparated(
                  shrinkWrap: true,
                  padding: Paddings.paddingV16,
                  controller: scrollController,
                  physics: const ScrollPhysics(),
                  itemCount: orderedItems!.length,
                  itemBuilder: (context, index) =>
                      DeliveryProduct(order: orderedItems[index]));
            } else if (state is OrderInfoError) {
              return Container();
            } else {
              return const AppLoading();
            }
          },
        )
        ,
        // decoration: const BoxDecoration(
        //   borderRadius: Radiuses.rt24,
        //   color: MyColors.white,
        // ),
      ),
    );
  }
}
