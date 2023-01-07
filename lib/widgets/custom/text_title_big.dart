import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_text_styles.dart';

class BigSection extends StatelessWidget {
  String? title;
  double? size;

  BigSection({Key? key, required this.title, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: AppTextStyles.sfPro600
          .copyWith(fontSize: size ?? 30.sp, letterSpacing: 0.3),
    );
  }
}
