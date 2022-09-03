import 'package:flutter/material.dart';

import '../../presentation/page/cart_page/widgets/cart_product/med_photo.dart';
import '../../presentation/page/cart_page/widgets/cart_product/med_product_details.dart';
import '../../utils/constants/border_radius.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/sized_box.dart';

class AppElementBox extends StatelessWidget {
  const AppElementBox({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingA12,
      child: child,
      decoration:
          BoxDecoration(color: MyColors.grey245, borderRadius: Radiuses.r12),
    );
  }
}
