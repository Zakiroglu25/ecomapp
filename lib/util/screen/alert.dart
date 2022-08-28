// Flutter imports:
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_text_styles.dart';
import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/paddings.dart';
import '../constants/text.dart';
import '../delegate/navigate_utils.dart';
import 'widget_or_empty.dart';
// Project imports:

class Alert {
  static show(BuildContext context,
      {Widget? image,
      Widget? secondButton,
      String? title,
      String? buttonText,
      String? content,
      Function? onTapCancel,
      bool cancelButton = false,
      Function? onTap}) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          final sW = MediaQuery.of(context).size.width;
          final buttonSize = (secondButton != null ||
                  onTapCancel != null ||
                  cancelButton != false)
              ? (sW - 76) / 2
              : sW - 66;
          return AlertDialog(
            backgroundColor: MyColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            insetPadding: Paddings.zero,
            content: Container(
              width: sW - 32,
              padding: Paddings.paddingA16,
              // color: MyColors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  image ??
                      // Container(
                      //   child: Image.asset(Assets.pngNote),
                      //   height: 120.sm,
                      //   width: 120.sm,
                      // ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  // Text(
                  //   title ?? MyText.operationIsSuccess,
                  //   style: AppTextStyles.sanF600.copyWith(fontSize: 18.sm),
                  // ),
                  SizedBox(
                    height: 10.sm,
                  ),
                  Padding(
                    padding: Paddings.paddingH16,
                    child: Text(
                      content ?? '',
                      // style: AppTextStyles.sanF400
                      //     .copyWith(fontSize: 16.sm, color: MyColors.grey163),
                    ),
                  ),
                  WidgetOrEmpty(
                    value: content != null,
                    child: SizedBox(
                      height: 18.sm,
                    ),
                  ),
                  Container(
                    // width: 100,
                    //height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetOrEmpty(
                          value: secondButton != null,
                          child: SizedBox(
                            width: buttonSize,
                            child: secondButton,
                          ),
                          elseChild: WidgetOrEmpty(
                              value: cancelButton || onTapCancel != null,
                              child: DoctoroButton(
                                  w: buttonSize,
                                  color: MyColors.grey245,
                                  // text: MyText.reject,
                                  // textColor: MyColors.black,
                                  onTap: () =>
                                      (onTapCancel?.call() ?? Go.pop(context))
                                  //  color: ,
                                  )),
                        ),
                        SizedBox(
                          width: buttonSize,
                          child: DoctoroButton(
                            // text: buttonText ?? MyText.ok,
                            onTap: () {
                              Go.pop(context);
                              if (onTap != null) {
                                onTap.call();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static body(BuildContext context,
      {Widget? image,
      Widget? secondButton,
      String? title,
      String? buttonText,
      Widget? content,
      TextAlign? textAlign,
      Function? onTapCancel,
      bool cancelButton = false,
      Function? onTap}) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          final sW = MediaQuery.of(context).size.width;
          final buttonSize = (secondButton != null ||
                  onTapCancel != null ||
                  cancelButton != false)
              ? (sW - 76) / 2
              : sW - 66;
          return AlertDialog(
            backgroundColor: MyColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            insetPadding: Paddings.zero,
            content: Container(
              width: sW - 32,
              padding: Paddings.paddingA16,
              // color: MyColors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  image ??
                      // Container(
                      //   child: Image.asset(Assets.pngNote),
                      //   height: 120.sm,
                      //   width: 120.sm,
                      // ),
                  SizedBox(
                    height: 16.sm,
                  ),
                  Text(
                    title ?? "operationIsSuccess",
                    textAlign: textAlign,
                    // style: AppTextStyles.sanF600.copyWith(fontSize: 18.sm),
                  ),
                  SizedBox(
                    height: 16.sm,
                  ),
                  content ?? Container(),
                  Container(
                    // width: 100,
                    //height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetOrEmpty(
                          value: secondButton != null,
                          child: SizedBox(
                            width: buttonSize,
                            child: secondButton,
                          ),
                          elseChild: WidgetOrEmpty(
                              value: cancelButton || onTapCancel != null,
                              child: DoctoroButton(
                                  w: buttonSize,
                                  color: MyColors.grey245,
                                  // text: MyText.reject,
                                  // textColor: MyColors.black,
                                  onTap: () =>
                                      (onTapCancel?.call() ?? Go.pop(context))
                                  //  color: ,
                                  )),
                        ),
                        SizedBox(
                          width: buttonSize,
                          child: DoctoroButton(
                            text: buttonText ?? "OK",
                            onTap: () {
                              Go.pop(context);
                              if (onTap != null) {
                                onTap.call();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
