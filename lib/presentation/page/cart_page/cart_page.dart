import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/border_radius.dart';
import 'package:doctoro/utils/constants/boxx.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/utils/screen/errorable_image.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/general/manat_price.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom/row_with_space.dart';
import 'widgets/cart_counter.dart';
import 'widgets/count_text.dart';
import 'widgets/counter_button.dart';
import 'widgets/receip_box.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
        title: MyText.cart,
        child: Container(
          padding: Paddings.paddingA16,
          // color: MyColors.green,
          child: Center(
              child: Container(
            padding: Paddings.paddingA12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ErrorableImage(
                  imageUrl: MockData.paracetamolImgURL,
                  w: 64,
                  h: 64,
                  r: 9,
                ),
                MySizedBox.w12,
                Flexible(
                  child: SpacedColumn(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    space: 8,
                    children: [
                      Text(
                        MockData.medicineName,
                        style: AppTextStyles.sfPro400H2.copyWith(
                          color: MyColors.black34,
                        ),
                      ),
                      Text(
                        MockData.pharmName,
                        style: AppTextStyles.sfPro400H2.copyWith(
                          color: MyColors.mainRED,
                        ),
                      ),
                      const RecipeBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ManatPrice(price: "1212"), CartCounter()],
                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: MyColors.grey245, borderRadius: Radiuses.r12),
          )),
        ));
  }
}
