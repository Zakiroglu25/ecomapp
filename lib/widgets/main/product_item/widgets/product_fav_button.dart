import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/widgets/custom/custom_animated_cross.dart';

import '../../../../infrastructure/model/response/search_items.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class ProductFavButton extends StatefulWidget {
  const ProductFavButton({Key? key, required this.product, required this.inFav})
      : super(key: key);
  final SimpleProduct? product;
  final bool inFav;
  @override
  State<ProductFavButton> createState() => _ProductFavButtonState();
}

class _ProductFavButtonState extends State<ProductFavButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: InkWrapper(
        onTap: () {
          context.read<FavoriteCubit>().addFavorite(widget.product!.guid,
              isFav: widget.product!.isFavorite!, inFav: widget.inFav);
          widget.product!.isFavorite = !widget.product!.isFavorite!;
          setState(() {});
        },
        child: Container(
          height: 48,
          width: 48,
          color: MyColors.transparent,
          child: Center(
            child: CustomAnimatedCross(
              second: SvgPicture.asset(
                Assets.svgFilledHearth,
                height: 28,
                width: 28,
              ),
              first: SvgPicture.asset(
                Assets.svgEmptyHearth,
                height: 28,
                width: 28,
              ),
              showFirst: !widget.product!.isFavorite!,
            ),
          ),
        ),
      ),
    );
  }
}
