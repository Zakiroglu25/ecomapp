import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/num.dart';

import '../../../../utils/constants/app_text_styles.dart';

class DeliveryPrice extends StatelessWidget {
  const DeliveryPrice({Key? key, required this.price}) : super(key: key);
  final num? price;
  @override
  Widget build(BuildContext context) {
    return price.toManat13(title: MyText.deliveryPrice);
  }
}
