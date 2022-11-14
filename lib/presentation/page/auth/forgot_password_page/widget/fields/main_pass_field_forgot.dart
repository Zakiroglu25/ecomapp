import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../../utils/constants/text.dart';
import '../../../../../../widgets/general/app_field.dart';
import '../../../../../../widgets/icons/invisible_icon.dart';
import '../../../../../../widgets/icons/visible_icon.dart';

class MainPassFieldForgot extends StatefulWidget {
  final controller;

  MainPassFieldForgot({this.controller});

  @override
  State<MainPassFieldForgot> createState() => _MainPassFieldForgotState();
}

class _MainPassFieldForgotState extends State<MainPassFieldForgot> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).passMainStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.new_pass,
          maxLines: 1,
          hint: MyText.enter_new_pass,
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
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          //controller: widget.controller,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateMainPass(value),
        );
      },
    );
  }
}
