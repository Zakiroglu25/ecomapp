import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/extensions/context.dart';

import '../../utils/constants/assets.dart';

class AppBigLogo extends StatelessWidget {
  const AppBigLogo({Key? key, this.size}) : super(key: key);
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size ?? context.sW / 5,
        height: size ?? context.sH / 5,
        child: SvgPicture.asset(
          Assets.svgLogo,
          color: MyColors.brand,
        ));
  }
}
