import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/constants/app_text_styles.dart';
import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/paddings.dart';
import '../../../../../util/constants/sized_box.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../util/screen/ink_wrapper.dart';
import '../../../../../widget/custom/doctoro_button.dart';

class PolicyBottomSheet extends StatelessWidget {
  const PolicyBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: false,
          enableDrag: true,
          isDismissible: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          context: context,
          builder: (context) => Padding(
            padding: Paddings.paddingH16,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              child: Column(
                children: [
                  MySizedBox.h16,
                  Container(
                    width: 45,
                    height: 4,
                    color: MyColors.grey188,
                  ),
                  MySizedBox.h16,
                  Text(MyText.ruleText,
                      style: AppTextStyles.sfPro700.copyWith(
                          fontSize: 32.sp, color: MyColors.black0)),
                  MySizedBox.h32,
                  Text(MyText.rules,
                      style: AppTextStyles.sfPro600
                          .copyWith(fontSize: 14.sp)),
                  Spacer(),
                  DoctoroButton(
                    color: MyColors.black0,
                  ),
                  MySizedBox.h32,
                ],
              ),
            ),
          ),
        );
      },
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            children: [
              TextSpan(text: 'Məxfilik siyasəti və '),
              TextSpan(
                text: 'istifadə qaydaları',
                // recognizer: TapGestureRecognizer()
                //   ..onTap = () => print('Tap Here onTap'),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
            style: AppTextStyles.sfPro400
                .copyWith(color: MyColors.grey130, fontSize: 12.sp)),
      ),
    );
  }
}