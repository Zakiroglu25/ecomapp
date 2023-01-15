import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_and_payment_phone_field.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/order_slide_to_confirm_button.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/payment_type_section.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import 'widgets/pharmacy_section.dart';

class IWillTakeTab extends StatelessWidget {
  const IWillTakeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: Paddings.paddingH16 + Paddings.paddingB24,
        physics: Physics.never,
        children: [
          const DeliveryAndPaymentPhoneField(),
          BlocBuilder<DeliveryAndPaymentCubit, DeliveryAndPaymentState>(
            builder: (context, state) {
              if (state is DeliveryAndPaymentSuccess) {
                final details = state.orderDetails;
                return SpacedColumn(
                  space: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PharmacySection(orderDetails: details),
                    BigSection(title: MyText.payment, size: 16.sp),
                    AppElementBox(
                        padding: Paddings.paddingA16 + Paddings.paddingV8,
                        child: CartTotalPrice(details.totalPrice)),
                  ],
                );
                ;
              } else if (state is DeliveryAndPaymentError) {
                return nil;
              } else {
                return AppLoading();
              }
            },
          ),
          MySizedBox.h24,
          const PaymentTypeSection(),
          MySizedBox.h24,
          const OrderSlideToConfirmButton()
        ]);
  }
}
