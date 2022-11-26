import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController? controller;

  PhoneField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.phone,
      maxLines: 1,
      hint: MyText.phone,
      upperCase: false,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
    );
  }
}
