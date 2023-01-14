import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/icons/check_icon.dart';
import 'package:uikit/widgets/icons/uncheck_icon.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/dividers.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';
import '../../general/app_element_box.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({Key? key, required this.card}) : super(key: key);
  final CardData card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16 + Paddings.paddingV5,
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Builder(builder: (_) {
              switch (card.brand?.toLowerCase()) {
                case 'master':
                  return Image.asset(Assets.pngMaster);
                case 'visa':
                  return Image.asset(Assets.pngVisa);
                default:
                  return Image.asset(Assets.pngTempCard);
              }
            }),
          ),
          MySizedBox.w12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('${card.pan}'), Text('${card.cardHolderName}')],
          ),
          //  Spacer(),
        ],
      ),
    );
  }
}
