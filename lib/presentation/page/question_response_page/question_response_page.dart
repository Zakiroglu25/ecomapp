import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_cubit.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_state.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../utils/constants/paddings.dart';
import '../../../widgets/general/app_loading.dart';
import 'widgets/faq_card.dart';

class AnswerQuestionPage extends StatefulWidget {
  @override
  State createState() {
    return AnswerQuestionPageState();
  }
}

class AnswerQuestionPageState extends State<AnswerQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: MyText.questionAnswer,
      user: false,
      notification: false,
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: MyColors.grey158,
          useInkWell: true,
        ),
        child: BlocBuilder<FaqCubit, FaqState>(
          builder: (context, state) {
            if (state is FaqSuccess) {
              final faqList = state.faqList.data;
              return ListOrEmpty(
                list: state.faqList.data,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: Paddings.paddingH16,
                    itemCount: state.faqList.data.length,
                    itemBuilder: (context, index) {
                      final currentFaq = faqList[index];
                      return FaqCard(faq: currentFaq);
                    }),
              );
            } else if (state is FaqLoading) {
              return AppLoading();
            }
            return EmptyWidget();
          },
        ),
      ),
    );
  }
}
