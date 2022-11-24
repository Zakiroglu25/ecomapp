import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/widgets/custom/custom_animated_cross.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class ProductFavButton extends StatefulWidget {
  ProductFavButton({Key? key,required this.guid}) : super(key: key);
  String? guid;

  @override
  State<ProductFavButton> createState() => _ProductFavButtonState();
}

class _ProductFavButtonState extends State<ProductFavButton> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        context.read<FavoriteCubit>().addFavorite();
        fav = !fav;
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
            showFirst: !fav,
          ),
        ),
      ),
    );
  }
}
