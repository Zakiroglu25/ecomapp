import 'package:doctoro/utils/extensions/context.dart';
import 'package:doctoro/utils/extensions/word.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/app_button.dart';

class DeliveryPayTotalButton extends StatelessWidget {
  const DeliveryPayTotalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton.black(
      w: context.dynamicW(.5),
      text: MyText.payTotal.withPrice(23.55),
    );
  }
}
