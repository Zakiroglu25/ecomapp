import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presentations/page/landing_page/landing_page.dart';
import '../../../presentations/page/user_page/user_page.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/durations.dart';
import '../../../utils/delegate/navigate_utils.dart';

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
