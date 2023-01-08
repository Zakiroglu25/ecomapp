import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/app_button.dart';

class UserLogOutButton extends StatelessWidget {
  const UserLogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppButton(
        onTap: () =>
            context.read<AuthenticationCubit>().showLogoutDialog(context),
        text: MyText.logout,
        color: MyColors.mainRED,
      ),
    );
  }
}
