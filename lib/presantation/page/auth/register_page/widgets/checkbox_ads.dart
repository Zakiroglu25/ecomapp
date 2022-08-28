import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/util/screen/fade_edge.dart';
import 'package:doctoro/util/screen/sheet.dart';
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../util/constants/app_text_styles.dart';
import '../../../../../../util/constants/colors.dart';
import '../../../../../../util/constants/text.dart';
import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../util/constants/paddings.dart';
import '../../../../../util/screen/ink_wrapper.dart';
import 'policy_bottom_sheet.dart';

class AdsCheckbox extends StatelessWidget {
  const AdsCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<RegisterCubit>(context).checkboxAds,
      builder: (context, snapshot) {
        return Row(
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
                  value: snapshot.data ?? false,
                  // color of tick Mark
                  activeColor: MyColors.mainRed,
                  onChanged: (v) {
                    BlocProvider.of<RegisterCubit>(context)
                        .updateCheckBoxAds(v!);
                  }),
            ),
            MySizedBox.w8,
            SizedBox(
              width: 258,
              child: RichText(
                text: TextSpan(
                    text: MyText.checkPrivacyAds,
                    style: AppTextStyles.sfPro400
                        .copyWith(color: MyColors.grey130, fontSize: 12.sp)),
              ),
            ),
          ],
        );
      },
    );
  }
}
