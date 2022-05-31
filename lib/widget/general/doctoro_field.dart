import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/sized_box.dart';
import '../../util/formatter/lower_case_formatter.dart';
import '../../util/formatter/upper_case_formatter.dart';

class DoctoroField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  // final String? title;
  final String? errorMessage;
  final String? infoMessage;
  final String? initialValue;
  final int? maxLenght;
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
  final String? suffixText;
  final TextInputType? textInputType;

  DoctoroField(
      {this.controller,
      this.label,
      this.hint,
      this.maxLenght,
      this.topMargin,
      this.maxLines,
      this.obscure,
      this.readOnly,
      this.upperCase,
      this.formatters,
      this.suffixIcon,
      // this.title,
      this.infoMessage,
      this.errorMessage,
      this.initialValue,
      this.textCapitalization,
      this.onChanged,
      this.onTap,
      this.prefixIcon,
      this.suffixText,
      this.textInputType})
      : assert(controller == null || initialValue == null,
            "her ikisi teyin ola bilmez");

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: (errorMessage == null ? 60 : 80) +
          (infoMessage != null ? 18.0 : 0.0),
      // color: MyColors.mainRED,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height:topMargin?? 6,),
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                height: 56,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: errorMessage == null
                            ? MyColors.transparent
                            : MyColors.error_red)),
                child: TextFormField(
                  autocorrect: false,
                  controller: controller,
                  textInputAction: TextInputAction.done,
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
                    label: Text(label!,style: TextStyle(color: MyColors.grey130),),
                    counterText: '',
                    border: InputBorder.none,
                    hintText: hint ?? "",
                    hintStyle: AppTextStyles.sfPro400
                        .copyWith(fontSize: 15, color: MyColors.grey130),
                    suffixText: suffixText ?? "",
                    filled: true,
                    prefixIcon: prefixIcon,
                    fillColor: MyColors.field_grey,
                    contentPadding: EdgeInsets.only(
                        left: 14.0,
                        bottom: 6.0,
                        top: 8.0,
                        right: (suffixIcon != null) ? 40 : 0),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  color: MyColors.transparent,
                  padding: const EdgeInsets.only(right: 8),
                  margin: const EdgeInsets.only(right: 2),
                  child: Tooltip(
                    message: errorMessage ?? "",
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            //  vertical: errorMessage == null ? 18 : 17,
                            horizontal: 2),
                        child: suffixIcon,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // WidgetOrEmpty(
          //   value: errorMessage != null,
          //   child: FadeIn(
          //     key: Key("b"),
          //     child: Text(
          //       errorMessage ?? "",
          //       style: AppTextStyles.sanF400.copyWith(color: MyColors.errorRED),
          //     ),
          //   ),
          //   elseChild: FadeIn(
          //     key: Key("a"),
          //     child: Text(
          //       (infoMessage ?? ""),
          //       style: AppTextStyles.sfPro400.copyWith(color: MyColors.orange),
          //     ),
          //   ),
          // ),
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
