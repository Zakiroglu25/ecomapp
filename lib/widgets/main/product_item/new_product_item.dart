import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_fav_button.dart';
import 'package:uikit/widgets/main/product_item/widgets/product_image.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../infrastructure/model/response/product_option_model.dart';
import '../../../presentation/page/product_details_page/product_details_page.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/screen/ink_wrapper.dart';
import 'widgets/product_details_and_buttons.dart';

class NewProductItem extends StatelessWidget {
  const NewProductItem({Key? key, required this.product}) : super(key: key);
  final SimpleProduct product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWrapper(
          onTap: () {
            Go.to(
                context,
                BlocProvider(
                  create: (context) =>
                      ProductOptionDetailsCubit()..fetchProduct(product.guid!),
                  child: ProductOptionDetails(),
                ));
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
                ProductImage(imageUrl: product.imageUrl),
                MySizedBox.w12,
                ProductDetailsAndButtons(
                  product: product,
                )
              ],
            ),
          ),
        ),
        ProductFavButton(product: product),
      ],
    );
  }
}
