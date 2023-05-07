import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../presentation/page/user_page/user_page.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/delegate/navigate_utils.dart';

class UserButton extends StatelessWidget {
  // HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        Go.to(context, PageViewExample());
        // globalPageController.animateTo(0,
        //     duration: Durations.ms300, curve: Curves.linear);
      },
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          child: SizedBox(
            height: 45,
            width: 45,
            child: Padding(
              padding: Paddings.paddingL16 + Paddings.paddingT2,
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.userProfile),
                radius: 22.5, // Yarıçapı, SizedBox boyutlarının yarısına ayarlayın
              ),
            ),
          ),
        ),
      ),
    );
  }
}
