import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../../utils/constants/text.dart';

class CodeFieldForgot extends StatelessWidget {
  //final passController;

  // CodeFieldForgot(this.passController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).codeStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          upperCase: false,
          formatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLenght: 6,
          obscure: true,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.words,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          // controller: passController,
          onChanged: (value) {
            BlocProvider.of<ForgotPassCubit>(context).updateCode(value);
            if (value.length == 6) {
              FocusScope.of(context).unfocus();
              context.read<ForgotPassCubit>().changeState(context: context);
            }
          },
        );
      },
    );
  }
}
