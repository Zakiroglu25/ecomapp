import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/widget_or_empty.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';
import '../custom/app_button.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Widget? elseChild;
  final Color? color;
  final double? h;
  final double? w;
  final String? imageUrl;
  final Function? onRefresh;

  EmptyWidget(
      {this.text,
      this.description,
      this.elseChild,
      this.h,
      this.onRefresh,
      this.color,
      this.w,
      this.imageUrl});

  EmptyWidget.error(
      {this.text = MyText.error,
      this.description,
      this.elseChild,
      this.onRefresh,
      this.h,
      this.color,
      this.w,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MySizedBox.h16,
                  Container(
                    width: 167,
                    height: 167,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                        width: 127.w,
                        height: 127.h,
                        child: Image.asset(imageUrl ?? Assets.pngMed)),
                  ),
                  MySizedBox.h16,
                  Center(
                    child: Text(text ?? MyText.error,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.sfPro700
                            .copyWith(fontSize: 24, color: MyColors.grey158)),
                  ),
                  MySizedBox.h10,
                  Padding(
                    padding: Paddings.paddingH40,
                    child: Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.sfPro400s16
                          .copyWith(fontSize: 16, color: MyColors.grey158),
                    ),
                  ),
                  MySizedBox.h10,
                  WidgetOrEmpty(
                      value: onRefresh != null,
                      child: Padding(
                        padding: Paddings.paddingH30,
                        child: AppButton(
                          text: MyText.tryAgain,
                          onTap: () => onRefresh?.call(),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
