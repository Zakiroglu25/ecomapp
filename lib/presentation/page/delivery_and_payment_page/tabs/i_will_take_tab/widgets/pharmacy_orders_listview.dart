import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';

class PharmacyOrdersListview extends StatelessWidget {
  const PharmacyOrdersListview({Key? key, required this.orders})
      : super(key: key);
  final List<OrderedItems> orders;

  @override
  Widget build(BuildContext context) {
    return ListViewSeparated(
      shrinkWrap: true,
      physics: Physics.never,
      padding: Paddings.zero,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Text(
          "${index + 1}. ${order.title}",
          style: AppTextStyles.sfPro400s14,
        );
      },
    );
  }
}
