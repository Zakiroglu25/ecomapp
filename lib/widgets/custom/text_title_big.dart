import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_text_styles.dart';

class BigSection extends StatelessWidget {
  BigSection({Key? key, required this.title}) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style:
          AppTextStyles.sfPro600.copyWith(fontSize: 30.sp, letterSpacing: 0.3),
    );
  }
}
