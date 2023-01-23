import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_pay_total_button.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/delivery_products.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/cart_order_utils.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../utils/constants/text.dart';
import 'widgets/delivery_headers.dart';

class CartOrderDetailsPage extends StatelessWidget {
  const CartOrderDetailsPage(
      {Key? key, required this.orderNumber, required this.status})
      : super(key: key);
  final int orderNumber;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      // floatingActionButton: DeliveryPayTotalButton(),
      barColor: CartOrderUtils.cartOrderStatus(status).color,
      backColor: CartOrderUtils.cartOrderStatus(status).color,
      showAppbarLittleText: true,
      user: false,
      title: "${MyText.package} $orderNumber",
      slivers: [DeliveryHeaders(status: status), DeliveryProducts()],
    );
  }
}
