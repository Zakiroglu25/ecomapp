import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/login/login_cubit.dart';
import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../../widgets/icons/invisible_icon.dart';
import '../../../../../widgets/icons/visible_icon.dart';

class ChangeNumberPassField extends StatefulWidget {
  // final passController;

  ChangeNumberPassField({required this.controller});

  final TextEditingController controller;

  @override
  State<ChangeNumberPassField> createState() => _ChangeNumberPassFieldState();
}

class _ChangeNumberPassFieldState extends State<ChangeNumberPassField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text != null || widget.controller.text != '') {
      BlocProvider.of<UserCubit>(context)
          .updatePassword(widget.controller.text);
    }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).passwordStream,
      builder: (context, snapshot) {
        return AppField(
          label: MyText.password,
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          obscure: obscure,
          // upperCase: false,
          controller: widget.controller,
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
              BlocProvider.of<UserCubit>(context).updatePassword(value),
        );
      },
    );
  }
}
