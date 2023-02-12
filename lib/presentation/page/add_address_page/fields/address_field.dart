import 'package:flutter/material.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../address_page/select_map_page/select_map_page.dart';

class AddressField extends StatelessWidget {
  final TextEditingController? controller;
  String? name;

  AddressField({this.controller, this.name}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.address,
      maxLines: 1,
      hint: MyText.addressAdd,
      readOnly: true,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      onTap: () async {
        Go.to(context, MapSample());
      },
      suffixIcon: InkWell(
          onTap: () async {
            Go.to(context, MapSample());
          },
          child: Icon(Icons.my_location_sharp)),
    );
  }
}
