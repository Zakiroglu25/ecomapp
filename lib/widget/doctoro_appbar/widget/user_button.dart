import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presantation/page/landing_page/landing_page.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/durations.dart';

class UserButton extends StatelessWidget {
  // HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: IconButton(
            onPressed: () {
              // Go.to(context, Pager.userCabinet());
              globalPageController.animateTo(0,
                  duration: Durations.ms300, curve: Curves.linear);
            },
            icon: SvgPicture.asset(Assets.svgUser)),
      ),
    );
  }
}
