import 'package:doctoro/presentation/page/cart_page/widgets/cart_total_property_manat.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/boxx.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/general/manat_price.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';
import '../../../widgets/general/app_element_box.dart';
import 'widgets/cart_product/cart_product.dart';
import 'widgets/cart_total_property.dart';

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
              child: ListView(
            shrinkWrap: true,
            physics: Physics.never,
            // space: 16,
            children: [
              CartProduct(),
              MySizedBox.h16,
              CartProduct(
                recipeRequired: true,
              ),
              MySizedBox.h16,
              CartProduct(
                recipeRequired: true,
                url: MockData.recipeImgURL,
              ),
              MySizedBox.h16,
              AppElementBox(
                child: SpacedColumn(space: 20, children: [
                  CartTotalPropertyManat(
                    title: MyText.orders,
                    value: '3435',
                  ),
                  CartTotalPropertyManat(
                    title: MyText.deliveryPrice,
                    value: '20',
                  ),
                  CartTotalPropertyManat(
                    title: MyText.total,
                    value: '20',
                    withBack: true,
                  ),
                ]),
              ),
            ],
          )),
        ));
  }
}
