import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_delivery_price.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_property.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/order_price.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/custom_animated_size.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_loading.dart';

class PaymentDetailsSection extends StatelessWidget {
  const PaymentDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      space: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigSection(
          title: MyText.payment,
          size: 16.sp,
        ),
        CustomAnimatedSize(
          child: BlocBuilder<DeliveryAndPaymentCubit, DeliveryAndPaymentState>(
            buildWhen: (p, n) {
              if (n is DeliveryAndPaymentOperationError) {
                return false;
              } else
                return true;
            },
            builder: (context, state) {
              if (state is DeliveryAndPaymentSuccess) {
                final details = state.orderDetails;
                return AppElementBox(
                  padding: Paddings.paddingA20,
                  child: SpacedColumn(
                    space: 20,
                    children: [
                      CartOrdersPrice(details.price),
                      CartDeliveryPrice(details.deliveryPrice),
                      // CartTotalProperty(
                      //     title: MyText.payWithInsurance,
                      //     value: StreamBuilder<bool>(
                      //       stream: BlocProvider.of<CartCubit>(context)
                      //           .insuranceCoverRequestedStream,
                      //       builder: (context, snapshot) {
                      //         return Switch.adaptive(
                      //             value: snapshot.data ?? false,
                      //             onChanged: (v) =>
                      //                 BlocProvider.of<CartCubit>(context)
                      //                     .updateInsuranceCover(v));
                      //       },
                      //     )),
                      CartTotalPrice(details.totalPrice)
                    ],
                  ),
                );
              } else if (state is DeliveryAndPaymentError) {
                return nil;
              } else {
                return AppLoading();
              }
            },
          ),
        ),
      ],
    );
  }
}
