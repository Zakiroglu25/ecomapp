import 'package:doctoro/widget/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../util/formatter/masked_text_controller_phone.dart';
import '../../../../../util/constants/text.dart';

class PhoneFieldRegister extends StatefulWidget {
  final TextEditingController? controller;

  PhoneFieldRegister({this.controller});

  @override
  State<PhoneFieldRegister> createState() => _PhoneFieldRegisterState();
}

class _PhoneFieldRegisterState extends State<PhoneFieldRegister> {
  late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = MaskedTextController.app();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: BlocProvider.of<RegisterCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return DoctoroField(
          maxLines: 1,
          title: MyText.phone,
          label: MyText.phone,
          hint: MyText.phone_hint,
          upperCase: true,
          textInputType: TextInputType.phone,
          //formatters: [PhoneNumberFormatter()],
          maxLenght: 15,
          // prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          // onChanged: (value) =>
          //     BlocProvider.of<RegisterCubit>(context).updatePhone(value),
        );
      },
    );
  }
}
