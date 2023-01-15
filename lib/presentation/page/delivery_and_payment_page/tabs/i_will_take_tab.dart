import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_and_payment_phone_field.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/order_slide_to_confirm_button.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/payment_type_section.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_loading.dart';

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
                final orders = details.orderedItems;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyText.pharmacy.toUpperCase(),
                        style: AppTextStyles.sfPro400s12
                            .copyWith(color: MyColors.grey158)),
                    AppElementBox(
                        padding: Paddings.paddingV16,
                        child: ListViewSeparated(
                          shrinkWrap: true,
                          itemCount: orders!.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return Text(
                              "${index + 1}. ${order.title}",
                              style: AppTextStyles.sfPro400s14,
                            );
                          },
                        )),
                    MySizedBox.h24,
                    AppElementBox(
                        padding: Paddings.paddingA16,
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
