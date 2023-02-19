import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/paddings.dart';

import '../../../../infrastructure/cubit/card_cubit/card_cubit.dart';
import '../../../../infrastructure/cubit/card_cubit/card_state.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/app_loading.dart';
import '../../../../widgets/general/empty_widget.dart';
import 'card_item_widget.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Paddings.paddingA16,
          child: BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state is CardSuccess) {
                return CardItemWidget(cardList: state.cardData.list);
              } else if (state is CardInProgress) {
                return const Center(
                  child: AppLoading(),
                );
              }
              return EmptyWidget(
                text: MyText.emptyText,
              );
            },
          ),
        ),
        MySizedBox.h32,
      ],
    );
  }
}
