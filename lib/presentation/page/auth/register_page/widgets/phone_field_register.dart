import 'package:doctoro/widgets/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/text.dart';

class PhoneFieldRegister extends StatefulWidget {
  final TextEditingController? controller;

  PhoneFieldRegister({this.controller});

  @override
  State<PhoneFieldRegister> createState() => _PhoneFieldRegisterState();
}

class _PhoneFieldRegisterState extends State<PhoneFieldRegister> {
  TextEditingController? controller;

  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return AppField(
          maxLines: 1,
          title: MyText.phone,
          label: MyText.phone,
          hint: MyText.phone_hint,
          upperCase: true,
          textInputType: TextInputType.phone,
          maxLenght: 15,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updatePhone(value),
        );
      },
    );
  }
}
