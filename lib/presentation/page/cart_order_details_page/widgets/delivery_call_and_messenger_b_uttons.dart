import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cart_circle_button_with_title.dart';

class DeliveryCallAndMessengerButtons extends StatelessWidget {
  const DeliveryCallAndMessengerButtons({
    Key? key,
    required this.storeGuid,
    required this.storeName,
    required this.orderGuid,
    required this.storePhone,
  }) : super(key: key);
  final String? storePhone, storeName, storeGuid, orderGuid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //space: 16,
      children: [
        CartCircleButtonWithTitle(
          svg: Assets.svgCall,
          title: MyText.call,
          onTap: () => launch("tel://$storePhone"),
        ),
        MySizedBox.w16,
        CartCircleButtonWithTitle(
          svg: Assets.svgMessage,
          title: MyText.messenger,
          onTap: () => Go.to(
              context,
              Pager.chat(
                  storeGuid: storeGuid!,
                  storeName: storeName!,
                  orderGuid: orderGuid!)),
        ),
      ],
    );
  }
}
