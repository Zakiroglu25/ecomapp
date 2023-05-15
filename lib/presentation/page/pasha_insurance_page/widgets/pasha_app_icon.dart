import 'package:flutter/material.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';

class PashaAppIcon extends StatelessWidget {
  const PashaAppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: Paddings.paddingV4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: MyColors.white),
      child: Image.asset(Assets.pasha),
    );
  }
}
