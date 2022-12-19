import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/model/response/search_items.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/assets.dart';
import '../../../custom/app_button.dart';

class ProductCartButton extends StatelessWidget {
  const ProductCartButton({Key? key, required this.product}) : super(key: key);
  final SimpleProduct product;

  @override
  Widget build(BuildContext context) {
    final inCart = product.inCart!;
    //final inCart = true;
    return Expanded(
      child: AppButton(
        color: inCart ? MyColors.brand : MyColors.mainGreen85,
        onTap: () => context.read<CartCubit>().add(product.guid),
        // w: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 30,
                child: inCart
                    ? SvgPicture.asset(Assets.svgBagCross)
                    : SvgPicture.asset(Assets.svgCart)),
            MySizedBox.w4,
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  inCart ? MyText.cancel : MyText.toCart,
                  textAlign: TextAlign.start,
                  style:
                      AppTextStyles.sfPro400h2.copyWith(color: MyColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
