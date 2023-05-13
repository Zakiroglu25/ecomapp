import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class LastNameFieldUser extends StatelessWidget {
  final TextEditingController? controller;

  LastNameFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != null || controller!.text != '') {
      BlocProvider.of<UserCubit>(context).updateLastname(controller!.text);
    }
    return StreamBuilder<String>(
        stream: BlocProvider.of<UserCubit>(context).lastnameStream,
        builder: (context, snapshot) {
        return AppField(
          title: MyText.lastName,
          maxLines: 1,
          hint: MyText.lastName,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateLastname(value),
        );
      }
    );
  }
}
