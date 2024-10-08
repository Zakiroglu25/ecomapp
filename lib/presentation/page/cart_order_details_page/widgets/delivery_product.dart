import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/order_details.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/num.dart';
import 'package:uikit/utils/extensions/word.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../widgets/custom/column_with_space.dart';
import '../../../../widgets/special/med_photo.dart';
import '../../cart_page/widgets/cart_product/widgets/cart_med_name.dart';

class DeliveryProduct extends StatelessWidget {
  const DeliveryProduct({Key? key, required this.order}) : super(key: key);
  final OrderedItems order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      //space: 16,
      children: [
        Expanded(flex: 1, child: MedPhoto(productOptionImages: order.images)),
        MySizedBox.w16,
        Flexible(flex: 3, child: CartMedName(name: '${order.title}')),
        MySizedBox.w16,
        Expanded(
          flex: 2,
          child: SpacedColumn(
              space: 4,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  order.isCoveredByInsurance!
                      ? MyText.insuranceCover
                      : MyText.insuranceDoesNotCover,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.sfPro400s12.copyWith(
                      color: order.isCoveredByInsurance!
                          ? MyColors.mainGreen85
                          : MyColors.darkRED),
                ),
                order.price.toManat13(),
              ]),
        )
      ],
    );
  }
}
