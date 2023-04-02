import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_update_address_cubit.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class RegionField extends StatelessWidget {
  final TextEditingController? controller;

  RegionField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '' && controller!.text != 'null')
      BlocProvider.of<AddAddressCubit>(context).updateCountry(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<AddAddressCubit>(context).countryStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.region,
          maxLines: 1,
          hint: MyText.region,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          onChanged: (value) => BlocProvider.of<AddAddressCubit>(context)
              .updateCountry(value),
        );
      }
    );
  }
}
