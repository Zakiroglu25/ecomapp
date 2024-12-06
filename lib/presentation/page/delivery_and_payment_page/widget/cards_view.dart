import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/card_cubit/card_cubit.dart';
import 'package:uikit/infrastructure/cubit/card_cubit/card_state.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import 'selectable_payment_card.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardState>(builder: (_, state) {
      if (state is CardInProgress) {
        return const AppLoading();
      } else if (state is CardSuccess) {
        List<CardData> cardList = state.cardData.list;
        final lastCard = cardList.lastOrNull;
        // cardList = [];
        return lastCard.isNotNull
            ? SelectablePaymentCard(card: lastCard!)
            : AppElementBox(
                onTap: () => Go.to(context, Pager.paymentMethodPage),
                child: const Center(child: Text(MyText.savedcardNotFound)));
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
