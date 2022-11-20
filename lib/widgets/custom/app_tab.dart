import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';
import 'package:uikit/widgets/custom/row_with_space.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/border_radius.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../main/cuppertabs_wp/cuppertabs_provider.dart';

class AppTab extends Tab {
  AppTab(
      {Key? key,
      this.index,
      this.color = Colors.black45,
      this.count,
      this.svg,
      this.text = ''})
      : super(key: key, child: Container(), height: 60);
  final int? index;
  Color color;
  final String? svg;
  String text;
  int? count;

  @override
  Widget build(BuildContext context) {
    final selected =
        Provider.of<CupperProvider>(context, listen: true).selected.index ==
            index;
    return SpacedRow(
      space: count != null ? 10 : 0,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon(iconData),
        svg != null
            ? AnimatedCrossFade(
                duration: Durations.ms200,
                firstChild: SvgPicture.asset(
                  svg!,
                  color: MyColors.main,
                ),
                secondChild: SvgPicture.asset(
                  svg!,
                  color: MyColors.black34,
                ),
                crossFadeState: selected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              )
            : Container(),
        Text(text),
        WidgetOrEmpty(
          value: count != null,
          child: AnimatedContainer(
            duration: Durations.ms200,
            height: 18,
            width: 18,
            padding: Paddings.paddingA2,
            decoration: BoxDecoration(
                borderRadius: Radiuses.r99,
                color: selected ? MyColors.main : MyColors.black34),
            child: FittedBox(
              child: Text(
                "$count",
                style:
                    AppTextStyles.sfPro400s12.copyWith(color: MyColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
