import 'package:flutter/material.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/colors.dart';

class DoctoroButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;
  final Color? passiveButtonColor;
  final Color? passiveTextColor;
  final double? borderRadius;
  final double? textSize;
  final Function? onTap;
  final FontWeight? fontWeight;
  final String? text;
  final Widget? child;
  final double? w;
  final bool? loading;
  late final bool? isButtonActive;
  final double? h;

  DoctoroButton(
      {this.color,
      this.loading,
      this.child,
      this.h,
      this.textSize,
      this.fontWeight,
      this.isButtonActive,
      this.highlightColor,
      this.passiveTextColor,
      this.passiveButtonColor,
      this.splashColor,
      this.w,
      this.textColor,
      this.onTap,
      this.borderRadius,
      this.text,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    bool active = isButtonActive ?? true;
    return Container(
      height: h ?? 52,
      width: w ?? double.infinity,
      decoration: BoxDecoration(
          color: (active)
              ? (color ?? MyColors.mainRed)
              : (passiveButtonColor ?? MyColors.btn_passive),
          border: Border.all(
              color: active
                  ? (borderColor ?? (color ?? MyColors.btn_passive))
                  : (passiveButtonColor ?? MyColors.btn_passive)),
          borderRadius: BorderRadius.circular(borderRadius ?? 12)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => (active) ? (onTap?.call()) : null,
          highlightColor: active
              ? (highlightColor ?? MyColors.white.withOpacity(0.3))
              : MyColors.transparent,
          splashColor: active
              ? (splashColor ?? Colors.transparent)
              : MyColors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          child: Center(
              child: (loading ?? false)
                  ? CircularProgressIndicator()
                  : (child ??
                      Text(
                        text ?? "",
                        style: AppTextStyles.sfPro400.copyWith(
                            color: active
                                ? (textColor ?? Colors.white)
                                : (passiveButtonColor ??
                                    MyColors.btn_passive),
                            fontSize: textSize ?? 16,
                            fontWeight: fontWeight ?? FontWeight.w500),
                      )),
            ),
          ),
      ),
    );
  }
}
