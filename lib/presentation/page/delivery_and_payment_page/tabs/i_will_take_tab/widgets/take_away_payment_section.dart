import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/cart_insurance_properties.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

class TakeAwayPaymentSection extends StatelessWidget {
  const TakeAwayPaymentSection({Key? key, required this.details})
      : super(key: key);
  final OrderDetails details;
  @override
  Widget build(BuildContext context) {
    final insuranceRequested = details.insuranceRequested!;
    return AppElementBox(
        padding: Paddings.paddingA20,
        child: Column(
          children: [
            CartInsuranceProperties(details: details),
            CartTotalPrice(insuranceRequested
                ? details.notCoveredByInsuranceAmount
                : details.totalPrice),
          ],
        ));
  }
}
