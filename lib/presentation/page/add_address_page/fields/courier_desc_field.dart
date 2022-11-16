import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';

class CourierDescField extends StatelessWidget {
  final TextEditingController? controller;

  CourierDescField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.courierDesc,
      maxLines: 1,
      hint: MyText.enterDesc,
      upperCase: false,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
    );
  }
}
