import 'package:flutter/material.dart';
import 'package:uikit/utils/enums/operation_type.dart';

import '../../../../../../infrastructure/model/response/cart_items.dart';
import '../../../../../../widgets/custom/row_with_space.dart';
import 'count_text.dart';
import 'counter_button.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key, required this.item}) : super(key: key);
  final CartItem? item;
  @override
  Widget build(BuildContext context) {
    return SpacedRow(
      space: 4,
      children: [
        CounterButton(
          count: item!.amount!,
          guid: item?.stockItemGuid,
          operationType: OperationType.delete,
        ),
        CountText(
          count: item?.amount,
        ),
        CounterButton(
          count: item!.amount!,
          guid: item?.stockItemGuid,
          operationType: OperationType.add,
        ),
      ],
    );
  }
}
