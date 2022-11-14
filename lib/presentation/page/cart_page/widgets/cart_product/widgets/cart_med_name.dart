import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/mock.dart';

class CartMedName extends StatelessWidget {
  const CartMedName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      MockData.medicineName,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: AppTextStyles.sfPro400h2.copyWith(
        color: MyColors.black34,
      ),
    );
  }
}
