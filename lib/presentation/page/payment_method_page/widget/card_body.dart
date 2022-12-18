import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';

import '../../../../infrastructure/cubit/card_cubit/card_cubit.dart';
import '../../../../infrastructure/cubit/card_cubit/card_state.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state is CardSuccess) {
                final cardList = state.cardList;
                return CardItemWidget(cardList: cardList);
              } else if (state is CardProgress) {
                return Center(
                  child: AppLoading.main(),
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

