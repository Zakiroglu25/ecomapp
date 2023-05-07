import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class SeriaFieldUser extends StatelessWidget {
  final TextEditingController controller;

  SeriaFieldUser({required this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // if (controller.text != null || controller.text != '') {
    //   BlocProvider.of<UserCubit>(context).updateSeria(controller.text);
    // }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).seriaStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.seriaNum,
          maxLines: 1,
          hint: MyText.seriaNum,
          suffixIcon: Tooltip(message: 'burda fin kod olacay'),
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.characters,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateSeria(value),
        );
      },
    );
  }
}
