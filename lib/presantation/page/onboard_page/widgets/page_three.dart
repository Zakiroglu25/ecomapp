import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/assets.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/pageview_custom.dart';


class PageViewThree extends StatelessWidget {
  const PageViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PageviewElement(
      // svgLogo: Assets.red_logo,
      bigText: MyText.on_boardThreeBig,
      littleText: MyText.on_boardThreeLittle,
      bigImage: Assets.capsule_png,
    );
  }
}
