import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_product.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/main/doctoro_bottom_sheet/widget/handle_line.dart';
import 'package:flutter/material.dart';

class DeliveryProducts extends StatelessWidget {
  const DeliveryProducts({Key? key}) : super(key: key);
  static const List<Widget> products = [
    DeliveryProduct(),
    DeliveryProduct(
      insuranceCover: false,
    ),
    DeliveryProduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      // shrinkWrap: false,
      // physics: Physics.alwaysBounce,
      child: Container(
        padding: Paddings.paddingH16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(child: HandleLine()),
            ListviewSeparated(
                shrinkWrap: true,
                physics: Physics.never,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return products[index];
                })
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: MyColors.white,
        ),
      ),
    );
  }
}
