import 'package:doctoro/util/constants/assets.dart';
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/pageview_custom.dart';

class PageViewOne extends StatelessWidget {
  const PageViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageviewElement(
      // svgLogo: Assets.red_logo,
      bigText: MyText.on_boardOneBig,
      littleText: MyText.on_boardOneLittle,
      bigImage: Assets.on_board_capsule,
    );
  }
}
