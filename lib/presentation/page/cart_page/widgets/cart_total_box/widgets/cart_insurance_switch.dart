import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubit/cart/index.dart';
import '../../../../../../utils/constants/text.dart';
import 'cart_total_property.dart';

class CartInsuranceSwitch extends StatelessWidget {
  const CartInsuranceSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartTotalProperty(
        title: MyText.removeFromList,
        value: StreamBuilder<bool>(
          stream:
              BlocProvider.of<CartCubit>(context).insuranceCoverRequestedStream,
          builder: (context, snapshot) {
            return Switch.adaptive(
                value: snapshot.data ?? false,
                onChanged: (v) => BlocProvider.of<CartCubit>(context)
                    .updateInsuranceCover(v));
          },
        ));
  }
}
