import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class RegionField extends StatelessWidget {
  final TextEditingController? controller;

  RegionField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.region,
      maxLines: 1,
      hint: MyText.region,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
    );
  }
}
