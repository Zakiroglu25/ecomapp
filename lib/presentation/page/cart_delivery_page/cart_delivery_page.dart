import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_pay_total_button.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_products.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/context.dart';
import 'package:uikit/utils/extensions/word.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';

import 'widgets/delivery_headers.dart';

class CartDeliveryPage extends StatelessWidget {
  const CartDeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      floatingActionButton: DeliveryPayTotalButton(),
      barColor: MyColors.orange254,
      backColor: MyColors.orange254,
      showAppbarLittleText: true,
      user: false,
      title: "Bağlama 002",
      slivers: [DeliveryHeaders(), DeliveryProducts()],
    );
  }
}
