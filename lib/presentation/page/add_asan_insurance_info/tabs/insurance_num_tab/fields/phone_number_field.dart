import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../../utils/constants/text.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<InsuranceCubit>(context)
          .updatePhoneNumber(controller.text);
    }
    print(controller.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<InsuranceCubit>(context).phoneNumberStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.phone,
          maxLines: 1,
          hint: MyText.phone_hint,
          upperCase: true,
          controller: controller,
          textInputType: TextInputType.phone,
          maxLenght: 16,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          onChanged: (value) =>
              BlocProvider.of<InsuranceCubit>(context).updatePhoneNumber(value),
        );
      },
    );
  }
}