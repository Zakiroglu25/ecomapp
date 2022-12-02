import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../../infrastructure/model/response/faq_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';

class FaqCard extends StatelessWidget {
  final FastAskedQuestion? faq;
  const FaqCard({this.faq});
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      margin: Paddings.paddingV5,
      padding: Paddings.paddingV12 + Paddings.paddingH16,
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
                    faq?.question ?? '',
                    style: AppTextStyles.sfPro600s16,
                  )),
              collapsed: Text(
                faq?.answer ?? '',
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "${faq?.answer}",
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
    ));
  }
}
