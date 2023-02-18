import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/enums/delivery_type.dart';
import 'package:uikit/widgets/custom/custom_slide_to_confirm_button.dart';

class OrderSlideToConfirmButton extends StatelessWidget {
  const OrderSlideToConfirmButton({Key? key, required this.deliveryType})
      : super(key: key);
  final DeliveryType deliveryType;
  @override
  Widget build(BuildContext context) {
    return CustomSlideToConfirmButton(
        text: MyText.makeOrder,
        action: (controller) async {
          controller.loading(); //starts loading animation
          await Future.delayed(const Duration(seconds: 3));
          context
              .read<DeliveryAndPaymentCubit>()
              .createOrderPayment(context: context);
          controller.success(); //starts success animation
        });
  }
}
