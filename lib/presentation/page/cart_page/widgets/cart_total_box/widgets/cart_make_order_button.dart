import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text.dart';
import '../../../../../../widgets/custom/doctoro_button.dart';

class CartMakeOrderButton extends StatelessWidget {
  const CartMakeOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: MyText.makeOrder,
      onTap: () {},
    );
  }
}
