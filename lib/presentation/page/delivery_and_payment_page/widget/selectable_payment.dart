import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/enums/payment_type.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/icons/check_icon.dart';

class SelectablePayment extends StatelessWidget {
  const SelectablePayment(
      {Key? key, required this.child, required this.paymentType, this.card})
      : super(key: key);
  final Widget child;
  final PaymentType paymentType;
  final CardData? card;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PaymentType>(
        stream:
            BlocProvider.of<DeliveryAndPaymentCubit>(context).paymentTypeStream,
        builder: (context, snapshot) {
          PaymentType type = PaymentType.ONLINE;
          final selectedCard = BlocProvider.of<DeliveryAndPaymentCubit>(context)
              .selectedCard
              .valueOrNull;
          if (snapshot.hasData) type = snapshot.data!;
          return Stack(
            children: [
              Padding(
                padding: Paddings.paddingV10,
                child: child,
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: InkWrapper(
                    onTap: () {
                      context
                          .read<DeliveryAndPaymentCubit>()
                          .updatePaymentType(paymentType);
                      context
                          .read<DeliveryAndPaymentCubit>()
                          .updateSelectedCard(card);
                    },
                    child: Center(
                        child: Padding(
                      padding: Paddings.paddingA16,
                      child: CheckIcon(value: paymentType == type),
                    ))),
              )
            ],
          );
        });
  }
}
