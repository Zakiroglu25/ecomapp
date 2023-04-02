import 'package:flutter/material.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/half_empty_widget.dart';

class PaymentTypeEmptyWidget extends StatelessWidget {
  const PaymentTypeEmptyWidget({Key? key, required this.text})
      : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return HalfEmptyWidget(
      imageUrl: Assets.pngWallet,
      color: MyColors.green235,
      text: MyText.emptyText,
      description: text ?? MyText.emptyWallet,
    );
  }
}
