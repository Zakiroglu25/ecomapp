import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/word.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../widgets/custom/column_with_space.dart';
import '../../cart_page/widgets/cart_product/widgets/cart_med_name.dart';
import '../../cart_page/widgets/cart_product/widgets/med_photo.dart';

class DeliveryProduct extends StatelessWidget {
  const DeliveryProduct({Key? key, this.insuranceCover = true})
      : super(key: key);
  final bool insuranceCover;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        //space: 16,
        children: [
          Expanded(flex: 1, child: MedPhoto()),
          MySizedBox.w16,
          Flexible(flex: 3, child: CartMedName()),
          MySizedBox.w16,
          Expanded(
            flex: 2,
            child: Container(
              child: SpacedColumn(
                  space: 4,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      insuranceCover
                          ? MyText.insuranceCover
                          : MyText.insuranceDoesNotCover,
                      textAlign: TextAlign.end,
                      style: AppTextStyles.sfPro400s12.copyWith(
                          color: insuranceCover
                              ? MyColors.mainGreen85
                              : MyColors.darkRED),
                    ),
                    Text('16.10'.withManat)
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
