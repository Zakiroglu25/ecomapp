
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';

class PasswordFieldUser extends StatelessWidget {
  final TextEditingController controller;

  PasswordFieldUser({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updatePassword(controller.text);
    }
    print(controller.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).passwordStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
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
              BlocProvider.of<UserCubit>(context).updatePassword(value),
        );
      },
    );
  }
}
