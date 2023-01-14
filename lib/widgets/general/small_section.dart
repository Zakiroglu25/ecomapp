import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';

class SmallSection extends StatelessWidget {
  const SmallSection({Key? key, required this.title, this.size})
      : super(key: key);
  final String title;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.sfPro400s14
          .copyWith(color: MyColors.grey158, fontSize: size),
    );
  }
}
