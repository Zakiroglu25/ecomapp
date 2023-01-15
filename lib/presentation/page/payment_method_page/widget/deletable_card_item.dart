import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/infrastructure/cubit/card_cubit/card_cubit.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/custom/app_button.dart';

import '../../../../utils/screen/alert.dart';
import '../../../../widgets/main/payment_type_card/payment_type_card.dart';

class DeletableCardItem extends StatelessWidget {
  const DeletableCardItem({Key? key, required this.card}) : super(key: key);
  final CardData card;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PaymentTypeCard(card: card),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: InkWrapper(
              highlightColor: Colors.transparent,
              onTap: () => Alert.show(context,
                  buttonText: MyText.yes,
                  onTap: () => context.read<CardCubit>().deleteCard(card.guid),
                  title: MyText.deleteCardInfo,
                  cancelButton: true),
              child: Padding(
                  padding: Paddings.paddingH16,
                  child: Center(
                      child: SvgPicture.asset(
                    Assets.svgDelete,
                    color: MyColors.errorRED,
                  )))),
        )
      ],
    );
  }
}
