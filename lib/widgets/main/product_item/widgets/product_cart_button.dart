import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/infrastructure/model/response/search_items.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../utils/constants/assets.dart';
import '../../../custom/app_button.dart';

class ProductCartButton extends StatefulWidget {
  const ProductCartButton({Key? key, required this.product}) : super(key: key);
  final SimpleProduct product;

  @override
  State<ProductCartButton> createState() => _ProductCartButtonState();
}

class _ProductCartButtonState extends State<ProductCartButton> {
  bool inCart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starLogic();
  }

  @override
  void didUpdateWidget(covariant ProductCartButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // starLogic();
  }

  void starLogic() {
    inCart = widget.product.isInCart!;
    setState(() {});
    bbbb("inCart:  ${widget.product.isInCart}");
    bbbb("inCart2:  ${inCart}");
  }

  @override
  Widget build(BuildContext context) {
    //final inCart = true;
    return Expanded(
      child: AppButton(
        color: widget.product.isInCart! ? MyColors.brand : MyColors.mainGreen85,
        onTap: () async {
          bool? res;
          if (widget.product.isInCart!) {
            res = await context
                .read<CartCubit>()
                .delete(context, guid: widget.product.guid);
          } else {
            res = await context
                .read<CartCubit>()
                .add(context, guid: widget.product.guid);
          }
          if (res == true) {
            widget.product.isInCart = !widget.product.isInCart!;
            setState(() {});
          }
        },
        // w: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 30,
                child: widget.product.isInCart!
                    ? SvgPicture.asset(Assets.svgBagCross)
                    : SvgPicture.asset(Assets.svgCart)),
            MySizedBox.w4,
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  widget.product.isInCart! ? MyText.cancel : MyText.toCart,
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
