import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class TitleField extends StatelessWidget {
  final TextEditingController? controller;

  TitleField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.city,
      maxLines: 1,
      hint: MyText.cityAdd,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      // errorMessage: snapshot.error == null ? null : '${snapshot.error}',
      controller: controller,
    );
  }
}
