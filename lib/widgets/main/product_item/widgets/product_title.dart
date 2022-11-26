import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 48,
        child: Text(
          title ?? '',
          style: AppTextStyles.sfPro400s14
              .copyWith(color: MyColors.black34, height: 1.8),
          //overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
