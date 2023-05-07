import 'package:flutter/material.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';

class PashaAppScreenshot extends StatelessWidget {
  const PashaAppScreenshot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: Paddings.paddingT20,
          child: Image.asset(Assets.pngPashaAppSS),
        ));
  }
}
