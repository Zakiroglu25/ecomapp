import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presantation/page/landing_page/landing_page.dart';
import '../../../presantation/page/user_page/user_page.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/durations.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/delegate/pager.dart';

class UserButton extends StatelessWidget {
  // HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
          onPressed: () {
            Go.to(context, UserPage());
            globalPageController.animateTo(0,
                duration: Durations.ms300, curve: Curves.linear);
          },
          icon: SvgPicture.asset(Assets.svgUser)),
    );
  }
}
