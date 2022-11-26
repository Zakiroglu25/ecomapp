import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_cubit.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_state.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../widgets/general/app_loading.dart';

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
      title: 'Sual-cavab',
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
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.faq_list.data.length,
                  itemBuilder: (context, index) {
                    return Card1(
                        question: state.faq_list.data[index].question,
                        answer: state.faq_list.data[index].answer);
                  });
            } else if (state is FaqLoading) {
              return AppLoading();
            }
            return Center(
              child: Text("Bilinməyən xəta"),
            );
          },
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  String? question;
  String? answer;

  Card1({this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.grey245,
        ),
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      question ?? '',
                      style: AppTextStyles.sfPro600s16,
                    )),
                collapsed: Text(
                  answer ?? '',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          answer!,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: AppTextStyles.sfPro400s14,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
