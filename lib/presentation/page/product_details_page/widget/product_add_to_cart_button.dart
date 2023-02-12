import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../infrastructure/cubit/cart/cart_cubit.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/app_button.dart';

class ProductAddToCartButton extends StatefulWidget {
  const ProductAddToCartButton(
      {Key? key, required this.guid, required this.isInCart})
      : super(key: key);
  final String? guid;
  final bool? isInCart;

  @override
  State<ProductAddToCartButton> createState() => _ProductAddToCartButtonState();
}

class _ProductAddToCartButtonState extends State<ProductAddToCartButton> {
  bool inCart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starLogic();
  }

  @override
  void didUpdateWidget(covariant ProductAddToCartButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    starLogic();
  }

  void starLogic() {
    inCart = widget.isInCart!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: inCart ? MyText.cancel : MyText.addToCart,
      color: inCart ? MyColors.brand : MyColors.mainGreen85,
      onTap: () async {
        bool? res = false;
        if (inCart) {
          res = await context
              .read<CartCubit>()
              .delete(context, guid: widget.guid, isCart: false);
        } else {
          res = await context.read<CartCubit>().add(context, guid: widget.guid);
        }
        bbbb("ressss of cart:  $res");
        if (res == true) {
          inCart = !inCart;
          setState(() {});
        }
      },
    );
  }
}
