import 'package:flutter/material.dart';

import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/colors.dart';

class Plus994 extends StatelessWidget {
  const Plus994({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 60,
      height: 12,
      padding: EdgeInsets.only(left: 10, top: 3),
      child: Center(
        child: Text(
          "+994 ",
          textAlign: TextAlign.center,
          style: AppTextStyles.sfPro400s14
              .copyWith(fontSize: 16, color: MyColors.black, height: 0.9),
        ),
      ),
    );
  }
}
