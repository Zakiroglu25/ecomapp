import 'dart:math' as math;

import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            Card1(),
            Card1(),
            Card1(),
            Card1(),
            Card1(),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
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
                      "Service description",
                      style: AppTextStyles.sfPro600s16,
                    )),
                collapsed: Text(
                  MyText.expan,
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
                          MyText.expan,
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
