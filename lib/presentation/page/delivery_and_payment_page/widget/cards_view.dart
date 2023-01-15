import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/card_cubit/card_cubit.dart';
import 'package:uikit/infrastructure/cubit/card_cubit/card_state.dart';
import 'package:uikit/widgets/main/payment_type_card/payment_type_card.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
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
        final cardList = state.cardData.list;
        final lastCard = cardList.last;

        return WidgetOrEmpty(
          value: cardList.isNotEmpty,
          child: SelectablePaymentCard(card: lastCard),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
