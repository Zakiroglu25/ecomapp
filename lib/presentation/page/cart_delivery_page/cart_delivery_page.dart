import 'package:doctoro/presentation/page/cart_delivery_page/widgets/delivery_products.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';
import 'widgets/delivery_headers.dart';

class CartDeliveryPage extends StatelessWidget {
  const CartDeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      barColor: MyColors.orange254,
      backColor: MyColors.orange254,
      showAppbarLargeText: true,
      user: false,
      title: "Bağlama 002",
      slivers: [DeliveryHeaders(), DeliveryProducts()],
    );
  }
}
