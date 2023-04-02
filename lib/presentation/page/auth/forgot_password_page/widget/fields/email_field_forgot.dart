import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../../utils/constants/text.dart';
import '../../../../../../widgets/general/app_field.dart';

class EmailFieldForgot extends StatelessWidget {
  final emailController;

  EmailFieldForgot(this.emailController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).emailStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.emailOrPhone,
          maxLines: 1,
          hint: MyText.emailOrPhone,
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          infoMessage: MyText.confirm_your_email,
          controller: emailController,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
