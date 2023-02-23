import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../../utils/constants/text.dart';
import '../../../../../../utils/formatter/phone_formatter.dart';
import '../../../../../../widgets/general/plus994.dart';

class PhoneFieldForgot extends StatelessWidget {
  final TextEditingController? controller;

  PhoneFieldForgot({this.controller});

  //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return AppField(
            title: MyText.phone,
            maxLines: 1,
            hint: MyText.phone,
            upperCase: true,
            textInputType: TextInputType.phone,
            formatters: [PhoneNumberFormatter()],
            maxLenght: 14,
            prefixIcon: Plus994(),
            textCapitalization: TextCapitalization.none,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            onChanged: (value) {
              BlocProvider.of<ForgotPassCubit>(context).updatePhone(value);
              if (value.length == 14) {
                FocusScope.of(context).unfocus();
                context.read<ForgotPassCubit>().changeState(context: context);
              }
            });
      },
    );
  }
}
