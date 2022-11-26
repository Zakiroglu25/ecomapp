import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class NameAddressField extends StatelessWidget {
  final TextEditingController? controller;

  NameAddressField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.nameAddress,
      maxLines: 1,
      hint: MyText.exampleName,
      upperCase: false,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
    );
  }
}
