import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_pay_total_button.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_products.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../utils/constants/text.dart';
import 'widgets/delivery_headers.dart';

class CartDeliveryPage extends StatelessWidget {
  const CartDeliveryPage({Key? key, required this.orderNumber})
      : super(key: key);
  final int orderNumber;
  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      floatingActionButton: DeliveryPayTotalButton(),
      barColor: MyColors.orange254,
      backColor: MyColors.orange254,
      showAppbarLittleText: true,
      user: false,
      title: "${MyText.package} $orderNumber",
      slivers: [DeliveryHeaders(), DeliveryProducts()],
    );
  }
}
