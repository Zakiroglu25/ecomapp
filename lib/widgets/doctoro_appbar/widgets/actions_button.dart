import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/widgets/doctoro_appbar/widgets/app_bar_action_item.dart';

import '../../../utils/constants/assets.dart';

class ActionsButton extends StatelessWidget {
  final Function? onTap;

  ActionsButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBarActionItem(
      onTap: null,
      child: SizedBox(
        width: 20,
        height: 40,
        child: SvgPicture.asset(
          Assets.svgCheck,
        ),
      ),
    );
  }
}
