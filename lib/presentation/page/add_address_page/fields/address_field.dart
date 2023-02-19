import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import '../../address_page/select_map_page/select_map_page.dart';

class AddressField extends StatelessWidget {
  final TextEditingController? controller;
  String? name;

  AddressField({this.controller, this.name}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '' && controller!.text != 'null')
      BlocProvider.of<AddAddressCubit>(context).updateStreet(controller!.text);
    return StreamBuilder<String>(
        stream: BlocProvider.of<AddAddressCubit>(context).streetStream,
        builder: (context, snapshot) {
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
        });
  }
}
