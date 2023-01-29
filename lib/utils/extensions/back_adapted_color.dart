import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

extension BackAdaptedColor on Color {
  Color get toTextColor {
    if (this == MyColors.red249) {
      return Colors.red;
    } else if (this == MyColors.grey245) {
      return MyColors.black34;
    } else if (this == MyColors.orange253) {
      return MyColors.orange242;
    } else if (this == MyColors.green235) {
      return MyColors.green85;
    } else {
      return MyColors.black34;
    }
  }
}
