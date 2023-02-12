import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/paddings.dart';
import 'policy_bottom_sheet.dart';

class PolicyCheckbox extends StatelessWidget {
  const PolicyCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<RegisterCubit>(context).checkBoxStream,
      builder: (context, snapshot) {
        return Padding(
          padding: Paddings.paddingV5,
          child: Row(
            children: [
              SizedBox(
                height: 18.0.sp,
                width: 18.0.sp,
                child: Checkbox(
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(width: 1, color: MyColors.grey188),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    value: snapshot.data ?? false,
                    // color of tick Mark
                    activeColor: MyColors.darkRED,
                    onChanged: (v) {
                      BlocProvider.of<RegisterCubit>(context)
                          .updateCheckBox(v!);
                    }),
              ),
              MySizedBox.w8,
              PolicyChechkBoxText(),
            ],
          ),
        );
      },
    );
  }
}
