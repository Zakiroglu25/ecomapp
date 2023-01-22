import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/selectable_payment.dart';
import 'package:uikit/utils/enums/payment_type.dart';
import 'package:uikit/widgets/main/payment_type_card/payment_type_card.dart';

class SelectablePaymentCard extends StatelessWidget {
  const SelectablePaymentCard({Key? key, required this.card}) : super(key: key);
  final CardData card;

  @override
  Widget build(BuildContext context) {
    return SelectablePayment(
        paymentType: PaymentType.card,
        card: card,
        child: PaymentTypeCard(card: card));
  }
}
