import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/assets.dart';
import '../../../custom/app_button.dart';

class ProductCartButton extends StatelessWidget {
  const ProductCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        // w: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30, child: SvgPicture.asset(Assets.svgCart)),
            MySizedBox.w4,
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  MyText.toCart,
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
