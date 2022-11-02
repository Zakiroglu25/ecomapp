import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_call_and_messenger_b_uttons.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_med_count.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_order_date.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_recipe.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_total_price.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';

class DeliveryHeaders extends StatelessWidget {
  const DeliveryHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: false,
        pinned: false,
        delegate: SliverAppDelegate(
            child: Container(
              color: MyColors.orange254,
              // height: 90,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SpacedColumn(
                  space: 12,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MySizedBox.h16,
                    DeliveryMedCount(
                      count: 8,
                    ),
                    DeliveryTotalPrice(
                      price: 64.00,
                    ),
                    DeliveryOrderDate(date: '27.08.2022'),
                    DeliveryRecipe(),
                    MySizedBox.h8,
                    DeliveryCallAndMessengerBUttons(),
                    MySizedBox.h8,
                  ],
                ),
              ),
            ),
            maxExtent_: 290));
  }
}
