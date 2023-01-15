import 'package:flutter/material.dart';
import 'package:uikit/widgets/custom/app_button.dart';

import '../../utils/constants/colors.dart';

class DoctoroTextButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final Function? onTap;
  final String? text;

  final Color? splashColor;
  final Color? highlightColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final double? w;
  final double? h;

  DoctoroTextButton(
      {this.splashColor,
      this.highlightColor,
      this.textSize,
      this.color,
      this.fontWeight,
      this.w,
      this.h,
      this.textColor,
      this.onTap,
      this.borderRadius,
      this.text,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text,
      color: Colors.transparent,
      splashColor: splashColor ?? MyColors.darkRED.withOpacity(0.2),
      highlightColor: highlightColor ?? Colors.transparent,
      w: w ?? 150,
      h: h ?? 30,
      textSize: textSize ?? 14,
      onTap: onTap,
      fitText: true,
      fontWeight: fontWeight ?? FontWeight.w500,
      borderRadius: borderRadius ?? 4,
      textColor: textColor ?? MyColors.darkRED,
    );
  }
}
