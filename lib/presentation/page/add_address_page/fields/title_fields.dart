import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';

class TitleField extends StatelessWidget {
  final TextEditingController? controller;

  TitleField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.city,
      maxLines: 1,
      hint: MyText.cityAdd,
      upperCase: false,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      // errorMessage: snapshot.error == null ? null : '${snapshot.error}',
      controller: controller,
    );
  }
}
