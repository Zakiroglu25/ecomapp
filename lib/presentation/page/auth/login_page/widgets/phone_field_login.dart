import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/login/login_cubit.dart';
import '../../../../../utils/constants/text.dart';

class PhoneFieldLogin extends StatelessWidget {
  // final phoneController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<LoginCubit>(context).emailStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.emailOrPhone,
          label: MyText.emailOrPhone,
          maxLines: 1,
          hint: MyText.emailOrPhone,
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          // suffixIcon: FieldCLearButton.elseEmpty(
          //   BlocProvider.of<LoginCubit>(context).uEmail.valueOrNull ?? '',
          //   onTap: () => BlocProvider.of<LoginCubit>(context).updateEmail(''),
          //   controller: emailController,
          // ),
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          // controller: emailController,
          onChanged: (value) =>
              BlocProvider.of<LoginCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
