import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_state.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_delivery_price.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_price.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/cart_total_property.dart';
import 'package:uikit/presentation/page/cart_page/widgets/cart_total_box/widgets/order_price.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/custom_animated_size.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../cart_page/widgets/cart_total_box/widgets/cart_total_property_manat.dart';

class CartInsuranceProperties extends StatelessWidget {
  const CartInsuranceProperties({Key? key, required this.details})
      : super(key: key);
  final OrderDetails details;
  @override
  Widget build(BuildContext context) {
    final insuranceRequested = details.insuranceRequested!;
    return WidgetOrEmpty(
      value: insuranceRequested,
      child: Column(
        children: [
          CartTotalPropertyManat(
            title: MyText.priceNotCovered,
            value: details.notCoveredByInsuranceAmount,
          ),
          Text(
            MyText.priceNotCoveredInfoText,
            style: AppTextStyles.sfPro400s16.copyWith(color: MyColors.grey158),
          ),
          CartTotalProperty(
              title: MyText.payWithInsurance,
              value: Switch.adaptive(
                  value: !details.payingForNotCovered!,
                  onChanged: (v) =>
                      BlocProvider.of<DeliveryAndPaymentCubit>(context)
                          .updateInsuranceCheckedIn(value: !v))),
          MySizedBox.h20,
        ],
      ),
    );
  }
}
