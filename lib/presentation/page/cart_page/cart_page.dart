import 'package:doctoro/utils/constants/border_radius.dart';
import 'package:doctoro/utils/constants/boxx.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/utils/screen/errorable_image.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';
import '';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
        title: MyText.cart,
        child: Container(
          padding: Paddings.paddingA16,
          color: MyColors.green,
          child: Center(
              child: Container(
            padding: Paddings.paddingA12,
            child: Row(
              children: [
                ErrorableImage(
                  imageUrl: MockData.paracetamolImg,
                  w: 160,
                  h: 160,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: MyColors.grey245, borderRadius: Radiuses.r12),
          )),
        ));
  }
}
