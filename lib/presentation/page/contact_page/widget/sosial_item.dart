import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/screen/ink_wrapper.dart';
import '../../../../utils/screen/widget_or_empty.dart';

class SocialItem extends StatelessWidget {
  final String? name;
  final String? content;
  final String? path;
  final Function? onTap;
  final bool? isPng;

  SocialItem(
      {required this.name,
      required this.path,
      required this.onTap,
      this.content,
      this.isPng});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap!.call(),
      child: Padding(
        padding: const EdgeInsets.only(top: 36.0),
        child: Row(
          children: [
            (isPng ?? false) ? Image.asset(path!) : SvgPicture.asset(path!),
            MySizedBox.w12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: AppTextStyles.sfPro400s14.copyWith(fontSize: 14.sm),
                ),
                WidgetOrEmpty(
                  value: content != null,
                  child: Container(
                    margin: Paddings.paddingT4,
                    child: Text(
                      content ?? "",
                      style:
                          AppTextStyles.sfPro400s14.copyWith(fontSize: 12.sm),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
