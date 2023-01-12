import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';

class NewPasswordFieldUser extends StatelessWidget {
  final TextEditingController controller;

  NewPasswordFieldUser({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updateNewPassword(controller.text);
    }
    print(controller.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).newPasswordStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.newPassword,
          maxLines: 1,
          hint: MyText.enter_new_pass,
          upperCase: true,
          controller: controller,
          textInputType: TextInputType.text,
          // formatters: [PhoneNumberFormatter(with994: false)],
          maxLenght: 16,
          //prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateNewPassword(value),
        );
      },
    );
  }
}
