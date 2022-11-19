import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/delegate/index.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import '../../address_page/select_map_page/select_map_page.dart';

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
          onTap: (){
            print("Salam");
            // Go.to(context, MapSample());
          },
          child: Icon(Icons.my_location_sharp)),

    );
  }
}
