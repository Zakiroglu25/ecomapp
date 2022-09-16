import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class EditFieldWidget extends StatelessWidget {
  final String? headText;
  final String? title;
  final String? subTitle;
  final Widget? prefixImageUrl;
  final String? sufixImageUrl;
  final bool? png;
  final bool? switchW;
  final Function? onTap;

  const EditFieldWidget(
      {Key? key,
      this.title,
      this.subTitle,
      this.prefixImageUrl,
      this.sufixImageUrl,
      this.headText,
      this.png,
      this.switchW, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(headText != null)
        Text(
          headText!,
          style: AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
        ),
        MySizedBox.h4,
        InkWrapper(
          onTap:()=>onTap!.call(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyColors.grey245,
            ),
            child: Column(
              children: [
                MySizedBox.h16,
                Row(
                  children: [
                    MySizedBox.w16,
                    if (sufixImageUrl != null)
                      png == false
                          ? SvgPicture.asset(sufixImageUrl!)
                          : Image.asset(sufixImageUrl!),
                    if (sufixImageUrl != null && switchW == false) MySizedBox.w16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title!,
                          style: AppTextStyles.sfPro400s16.copyWith(),
                        ),
                        if (subTitle != null)
                          Text(
                            subTitle!,
                            style: AppTextStyles.sfPro400s14
                                .copyWith(color: MyColors.grey158),
                          ),
                      ],
                    ),
                    Spacer(),
                    if(prefixImageUrl != null)
                    switchW == false
                        ? prefixImageUrl!
                        : Switch.adaptive(value: true, onChanged: (newValue) {}),
                    MySizedBox.w16,
                  ],
                ),
                MySizedBox.h16,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
