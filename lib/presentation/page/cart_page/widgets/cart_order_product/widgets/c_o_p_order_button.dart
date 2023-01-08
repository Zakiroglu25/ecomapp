import 'package:flutter/material.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/widgets/custom/app_button.dart';

import '../../../../../../utils/constants/text.dart';

class COPOrderButton extends StatelessWidget {
  const COPOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppButton.black(
        h: 48,
        w: 122,
        text: MyText.makeOrder,
        textSize: 14,
        onTap: () => Go.to(context, Pager.orderConfirm),
      ),
    );
  }
}
