import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widgets/custom/app_button.dart';
import '../../../../widgets/custom/column_with_space.dart';

class CartCircleButtonWithTitle extends StatelessWidget {
  const CartCircleButtonWithTitle(
      {Key? key, required this.svg, this.title, this.onTap})
      : super(key: key);

  final Function? onTap;
  final String svg;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      space: 8,
      children: [
        AppButton.black(
          onTap: onTap,
          w: 64,
          h: 64,
          child: SvgPicture.asset(svg),
        ),
        Text(title ?? '')
      ],
    );
  }
}
