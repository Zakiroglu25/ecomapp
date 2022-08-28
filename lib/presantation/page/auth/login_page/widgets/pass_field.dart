import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/login/login_cubit.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../widget/general/doctoro_field.dart';
import '../../../../../widget/icons/invisible_icon.dart';
import '../../../../../widget/icons/visible_icon.dart';

class PassField extends StatefulWidget {
  // final passController;

  PassField();
  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<LoginCubit>(context).passStream,
      builder: (context, snapshot) {
        return DoctoroField(
          label: MyText.password,
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          obscure: obscure,
          // upperCase: false,
          textInputType: TextInputType.text,
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
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          // controller: passController,
          onChanged: (value) =>
              BlocProvider.of<LoginCubit>(context).updatePass(value),
        );
      },
    );
  }
}
