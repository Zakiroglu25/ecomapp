import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/cash_payment_box.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/selectable_payment.dart';
import 'package:uikit/utils/enums/payment_type.dart';
import 'package:uikit/widgets/main/payment_type_card/payment_type_card.dart';

class SelectablePaymentCash extends StatelessWidget {
  const SelectablePaymentCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SelectablePayment(
        child: CashPaymentBox(), paymentType: PaymentType.cash);
  }
}
