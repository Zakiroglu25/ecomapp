import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';

class ProductDetailProperty extends StatelessWidget {
  const ProductDetailProperty(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingV5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title",
                style: AppTextStyles.sfPro400s16,
              ),
              Text(
                "$value",
                style:
                    AppTextStyles.sfPro400s16.copyWith(color: MyColors.grey130),
              ),
            ],
          ),
          MySizedBox.h12,
          const Divider(
            thickness: 1,
            color: MyColors.grey245,
          )
        ],
      ),
    );
  }
}
