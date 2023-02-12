import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../widgets/general/manat_price.dart';
import 'cart_total_property.dart';

class CartTotalPropertyManat extends StatelessWidget {
  const CartTotalPropertyManat({
    Key? key,
    required this.title,
    required this.value,
    this.withBack = false,
  }) : super(key: key);
  final String title;
  final num? value;
  final bool withBack;

  @override
  Widget build(BuildContext context) {
    return CartTotalProperty(
      title: title,
      value: ManatPrice(
          price: value,
          mainColor: withBack ? MyColors.white : MyColors.black,
          fontWeight: FontWeight.w400,
          backColor: withBack ? MyColors.black : MyColors.transparent,
          r: 99),
    );
  }
}
