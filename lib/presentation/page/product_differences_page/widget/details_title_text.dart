import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/model/response/product_option_details_model.dart';
import '../../../../utils/constants/app_text_styles.dart';

class DetailsTitleWidget extends StatelessWidget {
  const DetailsTitleWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetails? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(product!.title!,
          style: AppTextStyles.sfPro600.copyWith(fontSize: 17.sp)),
    );
  }
}
