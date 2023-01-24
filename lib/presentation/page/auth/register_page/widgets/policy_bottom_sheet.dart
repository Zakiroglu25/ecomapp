import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/infrastructure/cubit/register/register_cubit.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/screen/ink_wrapper.dart';
import '../../../../../utils/screen/sheet.dart';
import '../../../../../widgets/custom/app_button.dart';

class PolicyChechkBoxText extends StatelessWidget {
  const PolicyChechkBoxText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterCubit>(context);
    final checkConfirmed = bloc.checkbox.value;
    return InkWrapper(
      onTap: () {
        Sheet.display(
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: Paddings.paddingH16,
                    child: Column(
                      children: [
                        Text(MyText.ruleText,
                            style: AppTextStyles.sfPro700.copyWith(
                                fontSize: 32.sp, color: MyColors.black)),
                        MySizedBox.h32,
                        Text(MyText.rules,
                            style: AppTextStyles.sfPro600
                                .copyWith(fontSize: 14.sp)),
                        // Spacer(),
                        MySizedBox.h16,
                        // AppButton(
                        //   color: checkConfirmed
                        //       ? MyColors.errorRED
                        //       : MyColors.mainGreen85,
                        //   text: checkConfirmed
                        //       ? MyText.iAmDisAgree
                        //       : MyText.iAmAgree,
                        //   onTap: () {
                        //     bloc.inverseCheckBox();
                        //     return Go.pop(context);
                        //   },
                        // ),
                        AppButton(
                          color: MyColors.mainGreen85,
                          text: MyText.ok,
                          onTap: () {
                            // bloc.inverseCheckBox();
                            return Go.pop(context);
                          },
                        ),
                        MySizedBox.h32,
                      ],
                    ),
                  ),
                ],
              ),
            ));
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
            style: AppTextStyles.sfPro400s14
                .copyWith(color: MyColors.grey130, fontSize: 12.sp)),
      ),
    );
  }
}
