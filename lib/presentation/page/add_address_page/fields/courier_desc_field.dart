import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class CourierDescField extends StatelessWidget {
  final TextEditingController? controller;

  CourierDescField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.courierDesc,
      maxLines: 1,
      hint: MyText.enterDesc,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
    );
  }
}
