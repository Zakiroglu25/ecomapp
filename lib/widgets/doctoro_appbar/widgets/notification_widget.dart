import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/paddings.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/screen/ink_wrapper.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        Go.to(context, Pager.notificationPage);
        // globalPageController.animateTo(0,
        //     duration: Durations.ms300, curve: Curves.linear);
      },
      child: Container(
        height: 56,
        color: MyColors.transparent,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              //   color: MyColors.green,
              height: 30,
              width: 45,
              child: Padding(
                padding: Paddings.paddingT2 + Paddings.paddingR16,
                child: SvgPicture.asset(Assets.svgBell),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
