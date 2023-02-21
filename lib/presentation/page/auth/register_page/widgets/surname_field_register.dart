import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class SurNameFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  SurNameFieldRegister({this.controller}); //=//= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).surnameStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.lastName,
          label: MyText.lastName,
          maxLines: 1,
          hint: MyText.lastName,
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateSurName(value),
        );
      },
    );
  }
}
