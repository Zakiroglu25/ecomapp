import 'package:doctoro/utils/constants/paddings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/colors.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;
  final Color? passiveButtonColor;
  final Color? passiveTextColor;
  final double borderRadius;
  final double? textSize;
  final Function? onTap;
  final FontWeight? fontWeight;
  final String? text;
  final Widget? child;
  final double? w;
  final bool? loading;
  late final bool? isButtonActive;
  final double? h;

  AppButton(
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
        this.borderRadius = 24,
        this.text,
        this.borderColor});

  AppButton.black(
      {this.color = MyColors.black,
        this.loading,
        this.child,
        this.h = 48,
        this.textSize,
        this.fontWeight,
        this.isButtonActive,
        this.highlightColor,
        this.passiveTextColor,
        this.passiveButtonColor,
        this.splashColor,
        this.w,
        this.textColor = MyColors.white,
        this.onTap,
        this.borderRadius = 99,
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
              ? (color ?? MyColors.btnGreen)
              : (passiveButtonColor ?? MyColors.btn_passive),
          border: Border.all(
              color: active
                  ? (borderColor ?? (color ?? MyColors.btn_passive))
                  : (passiveButtonColor ?? MyColors.btn_passive)),
          borderRadius: BorderRadius.circular(borderRadius)),
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
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(
            child: (loading ?? false)
                ? CircularProgressIndicator()
                : Padding(
              padding: Paddings.paddingH8,
              child: (child ??
                  FittedBox(
                    child: Text(
                      text ?? "",
                      style: AppTextStyles.sfPro400s14.copyWith(
                          color: active
                              ? (textColor ?? Colors.white)
                              : (passiveButtonColor ??
                              MyColors.btn_passive),
                          fontSize: textSize ?? 16,
                          overflow: TextOverflow.clip,
                          fontWeight: fontWeight ?? FontWeight.w500),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}