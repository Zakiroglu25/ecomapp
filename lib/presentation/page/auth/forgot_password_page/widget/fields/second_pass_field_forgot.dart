//class SecondPassFieldForgot extends StatelessWidget {

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../../utils/constants/text.dart';
import '../../../../../../widgets/general/app_field.dart';
import '../../../../../../widgets/icons/invisible_icon.dart';
import '../../../../../../widgets/icons/visible_icon.dart';

class SecondPassFieldForgot extends StatefulWidget {
  final controller;

  SecondPassFieldForgot({this.controller});

  @override
  State<SecondPassFieldForgot> createState() => _SecondPassFieldForgotState();
}

class _SecondPassFieldForgotState extends State<SecondPassFieldForgot> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<ForgotPassCubit>(context).passSecondStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.enter_new_pass_again,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          obscure: obscure,
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
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          // controller: widget.controller,
          onChanged: (value) =>
              BlocProvider.of<ForgotPassCubit>(context).updateSecondPass(value),
        );
      },
    );
  }
}
