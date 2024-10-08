import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/custom/app_button.dart';

import '../../../../../infrastructure/cubit/login/login_cubit.dart';
import '../../../../../infrastructure/cubit/login/login_state.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../utils/delegate/pager.dart';

class LogRegButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Column(
        children: [
          loginButton(context),
          MySizedBox.h16,
          registerButton(context),
          MySizedBox.h20,
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return AppButton(
      onTap: () => context.read<LoginCubit>().login(context),
      text: MyText.enter,
      loading:
          (context.watch<LoginCubit>().state is LoginInProgress) ? true : false,
    );
  }

  AppButton registerButton(BuildContext context) {
    return AppButton(
      color: MyColors.grey288,
      textColor: MyColors.black,
      onTap: () => Go.to(context, Pager.register),
      text: MyText.register,
    );
  }
}
