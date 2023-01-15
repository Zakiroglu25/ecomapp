import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/widgets/custom/custom_animated_cross.dart';
import 'package:uikit/widgets/icons/uncheck_icon.dart';

import '../../utils/constants/assets.dart';

class CheckIcon extends StatelessWidget {
  final bool value;

  const CheckIcon({super.key, this.value = true});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedCross(
      showFirst: value == true,
      duration: Durations.ms200,
      first: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(Assets.svgCheck),
      ),
      second: UncheckIcon(),
    );
  }
}
