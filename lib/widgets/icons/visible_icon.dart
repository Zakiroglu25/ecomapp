import 'package:animate_do/animate_do.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/assets.dart';

class VisibleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
        key: Key('a'),
        child: SvgPicture.asset(
          Assets.svgEyeOn,
          color: MyColors.grey188,
        ));
  }
}
