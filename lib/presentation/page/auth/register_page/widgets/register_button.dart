import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: BlocProvider.of<RegisterCubit>(context).registerActiveeStream,
        builder: (context, snapshot) {
          return AppButton(
            isButtonActive: snapshot.data,
            // isButtonActive: true,
            loading: (context.watch<RegisterCubit>().state is RegisterLoading),
            onTap: () => context.read<RegisterCubit>().register(context),
            child: Text(
              MyText.goOn,
              style: AppTextStyles.sfPro500
                  .copyWith(color: MyColors.white, fontSize: 15.sp),
            ),
            color: MyColors.btnGreen,
          );
        });
  }
}
