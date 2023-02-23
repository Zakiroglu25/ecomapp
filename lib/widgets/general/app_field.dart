import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nil/nil.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sized_box.dart';
import '../../utils/formatter/lower_case_formatter.dart';
import '../../utils/formatter/upper_case_formatter.dart';
import '../../utils/screen/widget_or_empty.dart';

class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? title;
  final String? errorMessage;
  final String? infoMessage;
  final String? initialValue;
  final int? maxLenght;
  final Color? fillColor;
  final int? maxLines;
  final double? topMargin;
  final TextCapitalization? textCapitalization;
  bool? obscure = false;
  bool? readOnly = false;
  final bool? upperCase;
  final List<TextInputFormatter>? formatters;
  final ValueChanged<String>? onChanged;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final double radius;
  final FocusNode? focusNode;
  final String? suffixText;
  final TextInputType? textInputType;
  final double? paddingAll;

  AppField({
    this.controller,
    this.label,
    this.hint,
    this.maxLenght,
    this.topMargin,
    this.maxLines,
    this.obscure,
    this.readOnly,
    this.focusNode,
    this.fillColor = MyColors.grey245,
    this.onFieldSubmitted,
    this.upperCase,
    this.formatters,
    this.suffixIcon,
    this.radius = 12,
    this.title,
    this.infoMessage,
    this.errorMessage,
    this.initialValue,
    this.textCapitalization,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixText,
    this.textInputType,
    this.paddingAll,
  }) : assert(controller == null || initialValue == null,
            "her ikisi teyin ola bilmez");

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.ms200,
      height: (errorMessage == null ? 66 : 96) +
          (title != null ? 14 : 0) +
          (infoMessage != null ? 18.0 : 0.0),
      // color: MyColors.mainRED,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height:topMargin?? 6,),

          title.isNotNull
              ? Column(
                  children: [
                    Text(title ?? "",
                        style: AppTextStyles.sfPro400s14
                            .copyWith(letterSpacing: 0)),
                    MySizedBox.h3,
                  ],
                )
              : Container(),

          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                height: 49,
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(
                        color: errorMessage == null
                            ? MyColors.transparent
                            : MyColors.errorRED)),
                child: TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          16 * 4 +
                          90),
                  style: AppTextStyles.sfPro400s16,
                  autocorrect: false,
                  controller: controller,
                  focusNode: focusNode,
                  onFieldSubmitted: onFieldSubmitted,
                  textInputAction: textInputAction ?? TextInputAction.done,
                  obscureText: obscure ?? false,
                  maxLength: maxLenght,
                  maxLines: maxLines ?? null,
                  onChanged: onChanged,
                  initialValue: initialValue,
                  readOnly: readOnly ?? false,
                  //   enabled: false,
                  expands: maxLines != null ? false : true,
                  onTap: () => onTap?.call(),

                  keyboardType: textInputType ?? TextInputType.text,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.sentences,
                  inputFormatters: [...?customInputFormat(), ...?formatters],
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: hint ?? "",
                    hintStyle: AppTextStyles.sfPro400s16
                        .copyWith(color: MyColors.grey153),
                    suffixText: suffixText ?? "",
                    filled: true,
                    prefixIcon: prefixIcon,
                    fillColor: fillColor,
                    contentPadding: EdgeInsets.only(
                        left: 16.0, right: (suffixIcon != null) ? 40 : 0),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  color: MyColors.mainGrey,
                  padding: const EdgeInsets.only(right: 8),
                  margin: const EdgeInsets.only(right: 2),
                  child: Tooltip(
                    message: errorMessage ?? "",
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            //  vertical: errorMessage == null ? 18 : 17,
                            horizontal: 2),
                        child: suffixIcon ??
                            (errorMessage != null
                                ? Container(
                                    height: 20,
                                    //   color:MyColors.grey153,
                                    child: SvgPicture.asset(Assets.svgLock))
                                : Container()),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          MySizedBox.h3,
          AnimatedSize(
            duration: Durations.ms100,
            child: errorMessage != null
                ? FadeIn(
                    key: const Key("b"),
                    child: Text(
                      errorMessage ?? "",
                      style: AppTextStyles.sfPro400s14
                          .copyWith(color: MyColors.errorRED),
                    ),
                  )
                : (infoMessage != null
                    ? FadeIn(
                        key: const Key("a"),
                        child: Text(
                          (infoMessage ?? ""),
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.error_red),
                        ),
                      )
                    : SizedBox.shrink()),
          ),
        ],
      ),
    );
  }

  List<TextInputFormatter>? customInputFormat() {
    if (upperCase != null) {
      if ((upperCase!)) {
        return [UpperCaseFormatter()];
      } else {
        return [LowerCaseInputFormatter()];
      }
    } else {
      return null;
    }
  }
}
