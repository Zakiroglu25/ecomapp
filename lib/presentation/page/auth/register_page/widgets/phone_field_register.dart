import 'package:uikit/widgets/general/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/formatter/phone_formatter.dart';
import '../../../../../widgets/general/plus994.dart';

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
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updatePhone(value),
        );
      },
    );
  }
}
