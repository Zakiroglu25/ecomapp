import 'package:flutter/material.dart';

import '../../../../infrastructure/model/response/product_option_details_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';

class ProductManfactureInfo extends StatelessWidget {
  const ProductManfactureInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductOptionDetailsModel? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "İstehsal",
                style:
                AppTextStyles.sfPro400s14.copyWith(color: MyColors.black),
              ),
              Text(product!.manufacturer!.name!,
                  style: AppTextStyles.sfPro400s16
                      .copyWith(color: MyColors.grey130)),
            ],
          ),
          const Divider(),
          MySizedBox.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Məhsulun kodu",
                style:
                AppTextStyles.sfPro400s14.copyWith(color: MyColors.black),
              ),
              Text(product!.publicId!.toString(),
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.grey130)),
            ],
          ),
          Divider(),
          MySizedBox.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Resept",
                style:
                AppTextStyles.sfPro400s14.copyWith(color: MyColors.black),
              ),
              Text(
                  product!.prescriptionRequired!
                      ? "Tələb olunur"
                      : "Tələb olunmur",
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.grey130)),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
