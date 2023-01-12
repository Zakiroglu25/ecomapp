import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';

class OldPasswordFieldUser extends StatelessWidget {
  final TextEditingController controller;

  OldPasswordFieldUser({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updateOldPassword(controller.text);
    }
    print(controller.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).oldPasswordStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.oldPassword,
          maxLines: 1,
          hint: MyText.enterOldPassword,
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
              BlocProvider.of<UserCubit>(context).updateOldPassword(value),
        );
      },
    );
  }
}
