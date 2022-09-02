import 'package:doctoro/utils/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presentation/page/landing_page/landing_page.dart';
import '../../../presentation/page/user_page/user_page.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/durations.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/screen/ink_wrapper.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        Go.to(context, UserPage());
        globalPageController.animateTo(0,
            duration: Durations.ms300, curve: Curves.linear);
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          // color: MyColors.green,
          height: 24,
          width: 45,
          child: Padding(
            padding: Paddings.paddingR16,
            child: SvgPicture.asset(Assets.svgBell),
          ),
        ),
      ),
    );
  }
}
