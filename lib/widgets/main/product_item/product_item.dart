import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_fav_button.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_image.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../infrastructure/model/response/search_items.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import 'widgets/product_details_and_buttons.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.product, this.inFav = false})
      : super(key: key);
  final SimpleProduct product;
  //inFav mean that this widget is in Favorite page
  final bool inFav;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Go.to(context, Pager.productDetails(guid: widget.product.guid!));
          },
          child: Container(
            height: 126,
            padding: Paddings.paddingA12,
            decoration: BoxDecoration(
                borderRadius: Radiuses.r12, color: MyColors.grey245),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(imageUrl: widget.product.imageUrl),
                MySizedBox.w12,
                ProductDetailsAndButtons(
                  product: widget.product,
                )
              ],
            ),
          ),
        ),
        ProductFavButton(
          product: widget.product,
          inFav: widget.inFav,
        ),
        //  ProductCartButton()
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
