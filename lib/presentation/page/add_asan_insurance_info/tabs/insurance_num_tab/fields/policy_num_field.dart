import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../../utils/constants/text.dart';


class PolicyField extends StatelessWidget {
  final TextEditingController controller;

  const PolicyField({required this.controller});

  @override
  Widget build(BuildContext context) {
    // if (controller.text != null || controller.text != '') {
    //   BlocProvider.of<InsuranceCubit>(context).updatePolicyNumber(controller.text);
    // }
    return StreamBuilder<String>(
      stream: BlocProvider.of<InsuranceCubit>(context).policyNumberStream,
      builder: (context, snapshot) {
        return AppField(
          title: "Sığorta nömrəsi",
          maxLines: 1,
          hint: "Sığorta nömrəsini daxil edin",
          upperCase: true,
          controller: controller,
          textInputType: TextInputType.text,
          // formatters: [PhoneNumberFormatter(with994: false)],
          maxLenght: 16,
          //prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<InsuranceCubit>(context).updatePolicyNumber(value),
        );
      },
    );
  }
}
