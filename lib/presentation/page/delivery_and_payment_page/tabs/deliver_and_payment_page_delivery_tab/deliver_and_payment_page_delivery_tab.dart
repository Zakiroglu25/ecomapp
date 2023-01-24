import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/payment_type_section.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_address_field.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/order_slide_to_confirm_button.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/payment_details_section.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/save_card_check_box.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/static_delivery_field.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/enums/delivery_type.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';

class DeliverAndPaymentPageDeliveryTab extends StatelessWidget {
  const DeliverAndPaymentPageDeliveryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: Paddings.paddingA16 + Paddings.paddingB24,
        physics: Physics.never,
        children: [
          const StaticDeliveryWidget(),
          BigSection(title: MyText.address, size: 16.sp),
          MySizedBox.h24,
          const DeliveryAddressField(),
          const PaymentDetailsSection(),
          MySizedBox.h24,
          PaymentTypeSection(),
          MySizedBox.h8,
          SaveCardCheckBox(),
          MySizedBox.h24,
          const OrderSlideToConfirmButton(deliveryType: DeliveryType.COURIER)
        ]);
  }
}
