import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class HandleLine extends StatelessWidget {
  final double sW;

  HandleLine(this.sW);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (sW / 2) - 100),
      width: 33,
      height: 4,
      color: MyColors.grey130,
    );
  }
}
