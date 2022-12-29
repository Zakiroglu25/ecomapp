import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';

import '../../../../../../utils/constants/text.dart';
import '../../../../../../widgets/custom/app_button.dart';

class CartMakeOrderButton extends StatelessWidget {
  const CartMakeOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: MyText.makeOrder,
      onTap: () => context.read<CartCubit>().ordersRegister(context: context),
    );
  }
}
