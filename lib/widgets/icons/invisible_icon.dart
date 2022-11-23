import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../../utils/constants/assets.dart';

class InvisibleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
        key: Key('b'),
        child: SvgPicture.asset(
          Assets.svgEyeOff,
          color: MyColors.grey188,
        ));
  }
}
