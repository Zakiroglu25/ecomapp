import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/extensions/word.dart';
import 'package:uikit/widgets/custom/app_unicorn_button.dart';

import '../../../../../../utils/constants/gradients.dart';

class RecipeFileDeleteButton extends StatelessWidget {
  const RecipeFileDeleteButton({
    Key? key,
    required this.url,
    required this.cartGuid,
  }) : super(key: key);
  final String? url;
  final String? cartGuid;

  @override
  Widget build(BuildContext context) {
    return AppUnicornButton(
      padding: Paddings.paddingH6,
      onPressed: () => context
          .read<CartCubit>()
          .deletePrescription(context, cartGuid!, loading: false),
      child: Container(
        padding: Paddings.paddingH8 + Paddings.paddingV8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$url".clip10,
              overflow: TextOverflow.clip,
            ),
            Icon(Icons.cancel_rounded)
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: Radiuses.r99, gradient: Gradients.gBorder),
      ),
    );
  }
}
