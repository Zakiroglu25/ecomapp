import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/pageview_custom.dart';

class PageViewTwo extends StatelessWidget {
  const PageViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PageviewElement(
      // svgLogo: Assets.red_logo,
      bigText: MyText.on_boardTwoBig,
      littleText: MyText.on_boardTwoLittle,
      bigImage: Assets.courier_png,
    );
  }
}
