import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../../utils/constants/app_text_styles.dart';

class DeliveryOrderDate extends StatelessWidget {
  const DeliveryOrderDate({Key? key, required this.date}) : super(key: key);
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${MyText.orderDate}: ${date.formatDateTimeFromUtc}",
      style: AppTextStyles.sfPro500s13,
    );
  }
}
