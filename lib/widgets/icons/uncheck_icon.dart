import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

class UncheckIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: MyColors.grey158)),
    );
  }
}
