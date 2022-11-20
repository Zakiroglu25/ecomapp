import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class AddressField extends StatelessWidget {
  final TextEditingController? controller;

  AddressField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.address,
      maxLines: 1,
      hint: MyText.addressAdd,
      upperCase: false,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      suffixIcon: InkWell(
          onTap: () {
            print("Salam");
            // Go.to(context, MapSample());
          },
          child: Icon(Icons.my_location_sharp)),
    );
  }
}
