import 'package:uikit/widgets/general/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/register/register_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/icons/invisible_icon.dart';
import '../../../../../widgets/icons/visible_icon.dart';

class MainPassFieldRegister extends StatefulWidget {
  final controller;

  MainPassFieldRegister({this.controller});

  @override
  State<MainPassFieldRegister> createState() => _MainPassFieldRegisterState();
}

class _MainPassFieldRegisterState extends State<MainPassFieldRegister> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).passMainStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.password,
          label: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          suffixIcon: Material(
            color: Colors.transparent,
            child: GestureDetector(
              child: obscure ? VisibleIcon() : InvisibleIcon(),
              onTap: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            ),
          ),
          obscure: obscure,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          // controller: widgets.controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateMainPass(value),
        );
      },
    );
  }
}
