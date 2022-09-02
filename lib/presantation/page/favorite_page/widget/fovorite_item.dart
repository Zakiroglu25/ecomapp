import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../widget/custom/doctoro_button.dart';
import '../../product_details_page/product_details_page.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Go.to(context, ProductDetailsPage());
      },
      child: Container(
        height: 116,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.grey245,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.demo),
              MySizedBox.w12,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 199,
                        child: Text(MyText.demo),
                      ),
                      MySizedBox.w8,
                      SvgPicture.asset(Assets.svgFav),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("1 223.20 ₼-dan"),
                      MySizedBox.w22,
                      DoctoroButton(
                        borderRadius: 99,
                        w: 109,
                        h: 36,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: MyColors.white,
                            ),
                            Text(
                              "Sebete",
                              style: AppTextStyles.sfPro400
                                  .copyWith(color: MyColors.white),
                            ),
                          ],
                        ),
                        color: MyColors.green,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
