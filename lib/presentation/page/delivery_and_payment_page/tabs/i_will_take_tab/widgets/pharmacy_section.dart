import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/dividers.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import 'pharmacy_orders_listview.dart';
import 'pharmacy_section_header.dart';

class PharmacySection extends StatelessWidget {
  const PharmacySection({Key? key, required this.orderDetails})
      : super(key: key);
  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyText.pharmacy.toUpperCase(),
            style: AppTextStyles.sfPro400s12.copyWith(color: MyColors.grey158)),
        MySizedBox.h4,
        AppElementBox(
            padding: Paddings.paddingA16,
            child: SpacedColumn(
              space: 16,
              children: [
                PharmacySectionHeader(details: orderDetails),
                Dividers.h1grey,
                PharmacyOrdersListview(orders: orderDetails.orderedItems!),
              ],
            )),
      ],
    );
  }
}
