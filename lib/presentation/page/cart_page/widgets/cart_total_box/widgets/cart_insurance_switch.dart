import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import 'cart_total_property.dart';

class CartInsuranceSwitch extends StatelessWidget {
  const CartInsuranceSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalProperty(
        title: MyText.payWithInsurance,
        value: Switch.adaptive(value: true, onChanged: (newValue) {}));
  }
}
