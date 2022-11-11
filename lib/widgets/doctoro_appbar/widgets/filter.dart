import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/widgets/doctoro_appbar/widgets/app_bar_action_item.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarActionItem(
      onTap: null,
      child: SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset(
          Assets.svgFilter,
          color: MyColors.black,
        ),
      ),
    );
  }
}
