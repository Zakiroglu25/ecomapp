import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';

class AddressField extends StatelessWidget {
  final TextEditingController? controller;
  String? name;

  AddressField({this.controller, this.name}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: BlocProvider.of<AddAddressCubit>(context).streetStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller?.text = snapshot.data ?? '';
          }
          return AppField(
            title: MyText.address,
            maxLines: 1,
            hint: MyText.addressAdd,
            readOnly: true,
            //initialValue: snapshot.data,
            textInputType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            onTap: () async => Go.to(context, Pager.selectMapPage(context)),
            suffixIcon: Icon(Icons.my_location_sharp),
          );
        });
  }
}
