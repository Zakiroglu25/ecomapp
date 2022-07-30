import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/material.dart';

import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/sized_box.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../util/delegate/navigate_utils.dart';
import '../../../../../util/delegate/pager.dart';

class LogRegButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      // color: MyColors.green,
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
    return DoctoroButton(
      onTap: () {
        // context.read<LoginCubit>().login(context);
        Go.andRemove(context, Pager.landing);
      },
      text: MyText.enter,
      // loading:
      //     (context.watch<LoginCubit>().state is LoginInProgress) ? true : false,
    );
  }

  DoctoroButton registerButton(BuildContext context) {
    return DoctoroButton(
      color: MyColors.grey288,
      textColor: MyColors.black0,
      // borderColor: MyColors.mainColor,
      onTap: () {
        //context.read<RegisterCubit>().register(context);
        Go.to(context, Pager.register);
      },
      text: MyText.register,
    );
  }
}
