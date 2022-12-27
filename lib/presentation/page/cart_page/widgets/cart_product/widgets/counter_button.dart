import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../../../../utils/constants/border_radius.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/enums/operation_type.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {Key? key,
      required this.count,
      required this.guid,
      required this.operationType})
      : super(key: key);
  final int? count;
  final String? guid;
  final OperationType operationType;
  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => context.read<CartCubit>().updateInCart(guid,
          amount: count!, context: context, operationType: operationType),
      radius: 99,
      child: Container(
        width: 38,
        height: 38,
        child: Center(
            child: Text(
          operationType.toText,
          style: const TextStyle(color: MyColors.white),
        )),
        decoration:
            BoxDecoration(color: MyColors.grey158, borderRadius: Radiuses.r99),
      ),
    );
  }
}
