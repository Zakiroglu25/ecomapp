import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/icons/check_icon.dart';

class CashPaymentBox extends StatelessWidget {
  const CashPaymentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Image.asset(Assets.pngCash),
        ),
        MySizedBox.w12,
        Text(MyText.cashPayment),
        Spacer(),
        CheckIcon(value: false),
      ],
    );
  }
}
