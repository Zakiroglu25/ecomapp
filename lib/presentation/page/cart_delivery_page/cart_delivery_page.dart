import 'package:doctoro/presentation/page/cart_delivery_page/widgets/delivery_product.dart';
import 'package:doctoro/presentation/page/cart_delivery_page/widgets/recipe_image_button.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/physics.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/custom/listview_separated.dart';
import 'package:doctoro/widgets/custom/row_with_space.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../widgets/main/doctoro_bottom_sheet/widget/handle_line.dart';
import 'widgets/cart_circle_button_with_title.dart';

class CartDeliveryPage extends StatelessWidget {
  const CartDeliveryPage({Key? key}) : super(key: key);

  static const List products = [
    DeliveryProduct(),
    DeliveryProduct(
      insuranceCover: false,
    ),
    DeliveryProduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      barColor: MyColors.orange254,
      backColor: MyColors.orange254,
      user: false,
      slivers: [
        SliverPersistentHeader(
            floating: false,
            pinned: false,
            delegate: _SliverAppBarDelegate(Container(
              color: MyColors.orange254,
              // height: 90,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SpacedColumn(
                  space: 12,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Dərman sayı: 8",
                      style: AppTextStyles.sfPro500s13,
                    ),
                    Text(
                      "Toplam qiymət: 64.00 ₼",
                      style: AppTextStyles.sfPro500s13,
                    ),
                    Text(
                      "Sifariş tarixi: 27.08.2022",
                      style: AppTextStyles.sfPro500s13,
                    ),
                    SpacedRow(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      space: 16,
                      children: [
                        Text(
                          "${MyText.recipe}: ",
                          style: AppTextStyles.sfPro500s13,
                        ),
                        RecipeImageButton(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //space: 16,
                      children: [
                        CartCircleButtonWithTitle(
                          svg: Assets.svgCall,
                          title: MyText.call,
                          onTap: () {},
                        ),
                        MySizedBox.w16,
                        CartCircleButtonWithTitle(
                          svg: Assets.svgMessage,
                          title: MyText.messenger,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))),
        SliverFillRemaining(
          // shrinkWrap: false,
          // physics: Physics.alwaysBounce,
          child: Container(
            padding: Paddings.paddingH16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(child: HandleLine()),
                ListviewSeparated(
                    shrinkWrap: true,
                    physics: Physics.never,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return products[index];
                    })
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              color: MyColors.white,
            ),
          ),
        )
      ],
      title: "CartDeliveryPage",
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.child);

  final Widget child;

  @override
  double get minExtent => 0;

  @override
  double get maxExtent => 200;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: Colors.white,
      child: child,
    );
  }

  //test

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
