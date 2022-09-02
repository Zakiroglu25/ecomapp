import 'package:flutter/material.dart';

import '../../../../widgets/custom/row_with_space.dart';
import 'count_text.dart';
import 'counter_button.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpacedRow(
      space: 4,
      children: [
        CounterButton(
          text: '-',
        ),
        CountText(
          count: '5',
        ),
        const CounterButton(
          text: '+',
        ),
      ],
    );
  }
}
