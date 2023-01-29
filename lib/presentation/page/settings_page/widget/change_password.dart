import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/user/user_cubit.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/paddings.dart';
import '../../../../widgets/custom/app_button.dart';
import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import 'new_pass_field.dart';
import 'old_pass_field.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  TextEditingController? controllerNew = TextEditingController();
  TextEditingController? controllerOld = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Şifrəni dəyiş",
        contextA: context,
        user: false,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingA16,
        children: [
          OldPasswordFieldUser(controller: controllerOld!),
          NewPasswordFieldUser(controller: controllerNew!),
          AppButton(
            text: MyText.save,
            onTap: () {
              context.read<UserCubit>().resetPassword(context);
            },
          ),
        ],
      ),
    );
  }
}
