import 'package:doctoro/widget/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/constants/text.dart';

class PhoneFieldLogin extends StatelessWidget {
  // final phoneController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: BlocProvider.of<LoginCubit>(context).emailStream,
      builder: (context, snapshot) {
        return DoctoroField(
          label: MyText.phone,
          maxLines: 1,
          hint: MyText.phone_hint,
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
          // onChanged: (value) =>
              // BlocProvider.of<LoginCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
