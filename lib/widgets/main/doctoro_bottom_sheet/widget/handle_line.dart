import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class HandleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.paddingV8,
      padding: EdgeInsets.symmetric(horizontal: (context.sW / 2) - 100),
      width: 33,
      height: 4,
      color: MyColors.grey288,
    );
  }
}
