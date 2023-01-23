import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_and_payment_phone_field.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/order_slide_to_confirm_button.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/payment_type_section.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/enums/delivery_type.dart';

import 'widgets/take_away_pharmacy_and_order_details.dart';

class IWillTakeTab extends StatelessWidget {
  const IWillTakeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: Paddings.paddingH16 + Paddings.paddingB24,
        physics: Physics.never,
        children: const [
          DeliveryAndPaymentPhoneField(),
          TakeAwayPharmacyAndOrderDetails(),
          MySizedBox.h24,
          PaymentTypeSection(),
          MySizedBox.h24,
          OrderSlideToConfirmButton(deliveryType: DeliveryType.IN_STORE_PICK_UP)
        ]);
  }
}
