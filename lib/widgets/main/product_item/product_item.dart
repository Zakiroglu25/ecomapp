import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
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
  late SimpleProduct product;
  //inFav mean that this widget is in Favorite page
  late bool inFav;

  Color color = Colors.black87;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLogic();
  }

  @override
  void didUpdateWidget(covariant ProductItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    startLogic();
  }

  void startLogic() {
    product = widget.product;
    inFav = widget.inFav;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () =>
              Go.to(context, Pager.productDetails(guid: product.guid!)),
          child: Container(
            height: 115.h,
            padding: Paddings.paddingA12,
            decoration: BoxDecoration(
                borderRadius: Radiuses.r12, color: MyColors.grey245),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(imageUrl: product.imageUrl),
                MySizedBox.w12,
                ProductDetailsAndButtons(product: product)
              ],
            ),
          ),
        ),
        ProductFavButton(
          product: product,
          inFav: inFav,
        ),

        // InkWrapper(
        //   child: Container(
        //     width: 20,
        //     height: 20,
        //     color: product.isInCart! ? MyColors.red250 : MyColors.blue55,
        //   ),
        //   onTap: () {
        //     //  color = Rndm.color;
        //     product.isInCart = !product.isInCart!;
        //     setState(() {});
        //   },
        // )
        //  ProductCartButton()
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
