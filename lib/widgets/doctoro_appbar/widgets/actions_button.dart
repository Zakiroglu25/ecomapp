import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/screen/ink_wrapper.dart';

class ActionsButton extends StatelessWidget {
  final Function? onTap;

  ActionsButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return InkWrapper(
        onTap: () => onTap?.call(),
        child: Container(
          color: MyColors.transparent,
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 40,
                child: SvgPicture.asset(
                  Assets.svgCheck,
                ),
              ),
              MySizedBox.w12,
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
