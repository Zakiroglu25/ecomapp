import 'package:uikit/utils/constants/text.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';

class DeliveryMedCount extends StatelessWidget {
  const DeliveryMedCount({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${MyText.countOfMedicine}: $count",
      style: AppTextStyles.sfPro500s13,
    );
  }
}
