import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/assets.dart';

class MinusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      child: SvgPicture.asset(Assets.svgMinus2),
    );
  }
}
