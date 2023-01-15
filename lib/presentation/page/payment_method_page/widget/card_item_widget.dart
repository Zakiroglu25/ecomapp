import 'package:flutter/material.dart';
import 'package:uikit/presentation/page/payment_method_page/widget/deletable_card_item.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/dividers.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import '../../../../infrastructure/model/response/card_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    Key? key,
    required this.cardList,
  }) : super(key: key);

  final List<CardData> cardList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyText.cards,
          style: AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
        ),
        MySizedBox.h4,
        Container(
            decoration: BoxDecoration(
              borderRadius: Radiuses.r12,
              color: MyColors.grey245,
            ),
            child: AppElementBox(
              padding: Paddings.paddingV16,
              child: ListViewSeparated(
                  physics: Physics.never,
                  padding: Paddings.zero,
                  shrinkWrap: true,
                  itemCount: cardList.length,
                  itemBuilder: (context, index) =>
                      DeletableCardItem(card: cardList[index]),
                  separator: Dividers.h16grey),
            )),
      ],
    );
  }
}
