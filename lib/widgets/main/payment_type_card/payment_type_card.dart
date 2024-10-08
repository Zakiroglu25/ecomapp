import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';

import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';

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
            children: [
              Text(
                '${card.pan}',
                style: AppTextStyles.sfPro600,
              ),
              Text('${card.cardHolderName}',
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.grey158))
            ],
          ),
          //  Spacer(),
        ],
      ),
    );
  }
}
