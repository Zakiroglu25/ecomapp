import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/cards_view.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/selectable_payment_cash.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/dividers.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import '../../../../utils/enums/payment_type.dart';
import 'cash_payment_box.dart';
import 'online_payment_box.dart';
import 'selectable_payment.dart';

class PaymentTypeSection extends StatelessWidget {
  const PaymentTypeSection({Key? key, this.showCashPayment}) : super(key: key);
  final bool? showCashPayment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyText.paymentType.toUpperCase(),
            style: AppTextStyles.sfPro400s12.copyWith(color: MyColors.grey158)),
        MySizedBox.h4,
        const AppElementBox(
          padding: Paddings.zero,
          child: SpacedColumn(
            space: 0,
            padding: Paddings.paddingV5,
            children: [
              CardsView(),
              Dividers.h1grey,
              SelectablePayment(
                  child: OnlinePaymentBox(), paymentType: PaymentType.ONLINE),
              Dividers.h1grey,
              SelectablePaymentCash()
            ],
          ),
        ),
      ],
    );
  }
}
