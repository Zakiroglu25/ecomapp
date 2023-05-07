import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';

class EmailFieldUser extends StatelessWidget {
  final TextEditingController controller;

  EmailFieldUser(
      {required this.controller}); //=//= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updateEmail(controller.text);
    }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).emailStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.email,
          maxLines: 1,
          hint: MyText.email,
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
