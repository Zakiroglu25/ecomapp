import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';

class AsanFinanceTab extends StatelessWidget {
  const AsanFinanceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: Column(
        children: [
          MySizedBox.h16,
          AppField(

            title: "FIN kod",
            hint: "Daxil edin",
          ),
          Row(
            children: [
              SizedBox(
                height: 18.0.h,
                width: 18.0.w,
                child: Checkbox(

                    side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(width: 1, color: MyColors.grey188),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    value: false,
                    // color of tick Mark
                    activeColor: MyColors.darkRED,
                    onChanged: (v) {}),
              ),
              MySizedBox.w8,
              SizedBox(
                width: 258,
                child: RichText(
                  text: TextSpan(
                      text: MyText.asanCheckbox,
                      style: AppTextStyles.sfPro400s14
                          .copyWith(color: MyColors.grey130, fontSize: 12.sp)),
                ),
              ),
            ],
          ),
          Spacer(),
          AppButton(
            text: MyText.save,
          ),
          MySizedBox.h24
        ],
      ),
    );
  }
}