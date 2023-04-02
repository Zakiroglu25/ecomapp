import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/extensions/context.dart';

import '../../../../utils/constants/colors.dart';

class HandleLine extends StatelessWidget {
  const HandleLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: Paddings.paddingV10,
        padding: EdgeInsets.symmetric(horizontal: (context.sW / 2) - 100),
        width: 33,
        height: 4,
        color: MyColors.grey288,
      ),
    );
  }
}
