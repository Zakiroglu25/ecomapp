import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/constants/text.dart';
import '../../../../../widget/general/doctoro_field.dart';

class EmailFieldRegister extends StatelessWidget {
  final TextEditingController ?controller;

  EmailFieldRegister({this.controller}); //=//= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: BlocProvider.of<RegisterCubit>(context).emailStream,
      builder: (context, snapshot) {
        return DoctoroField(
          // title: MyText.email,
          label: MyText.email,
          maxLines: 1,
          hint: MyText.email,
          upperCase: false,
          textInputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //controller: controller,
          // onChanged: (value) =>
          //     BlocProvider.of<RegisterCubit>(context).updateEmail(value),
        );
      },
    );
  }
}
