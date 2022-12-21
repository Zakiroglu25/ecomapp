import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/mock.dart';

class CartMedName extends StatelessWidget {
  const CartMedName({Key? key, required this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: AppTextStyles.sfPro400h2.copyWith(
        color: MyColors.black34,
      ),
    );
  }
}
