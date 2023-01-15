import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text.dart';
import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/paddings.dart';

class AdsCheckbox extends StatelessWidget {
  const AdsCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<RegisterCubit>(context).checkboxAds,
      builder: (context, snapshot) {
        return InkWrapper(
          onTap: () => BlocProvider.of<RegisterCubit>(context)
              .updateCheckBoxAds(!snapshot.data!),
          child: Padding(
            padding: Paddings.paddingV5,
            child: Row(
              children: [
                SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                            BorderSide(width: 1, color: MyColors.grey188),
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      value: snapshot.data ?? false,
                      // color of tick Mark
                      activeColor: MyColors.darkRED,
                      onChanged: (value) {
                        BlocProvider.of<RegisterCubit>(context)
                            .updateCheckBoxAds(value!);
                      }),
                ),
                MySizedBox.w8,
                SizedBox(
                  width: 258,
                  child: RichText(
                    text: TextSpan(
                        text: MyText.checkPrivacyAds,
                        style: AppTextStyles.sfPro400s14.copyWith(
                            color: MyColors.grey130, fontSize: 12.sp)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
