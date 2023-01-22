import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/row_with_space.dart';
import 'package:uikit/widgets/special/store_logo.dart';

class PharmacySectionHeader extends StatelessWidget {
  const PharmacySectionHeader({Key? key, required this.details})
      : super(key: key);
  final OrderDetails details;

  @override
  Widget build(BuildContext context) {
    return SpacedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      space: 12,
      children: [

        StoreLogo(
            url: 'https://e-tibb.az/upload/enterprises/small/aptek-logo.png'),
        SpacedColumn(
          space: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${details.storeName}",
              style: AppTextStyles.sfPro600s16,
            ),
            Text(
              "${details.storeName}",
              style:
                  AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
            ),
          ],
        ),
      ],
    );
  }
}
