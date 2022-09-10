import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:flutter/material.dart';

import 'cart_circle_button_with_title.dart';

class DeliveryCallAndMessengerBUttons extends StatelessWidget {
  const DeliveryCallAndMessengerBUttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //space: 16,
      children: [
        CartCircleButtonWithTitle(
          svg: Assets.svgCall,
          title: MyText.call,
          onTap: () {},
        ),
        MySizedBox.w16,
        CartCircleButtonWithTitle(
          svg: Assets.svgMessage,
          title: MyText.messenger,
          onTap: () {},
        ),
      ],
    );
  }
}
