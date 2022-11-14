import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class NameFieldUser extends StatelessWidget {
  final TextEditingController controller;

  const NameFieldUser({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updateName(controller.text);
    }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).nameStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.name,
          hint: MyText.name,
          upperCase: false,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateName(value),
        );
      },
    );
  }
}
