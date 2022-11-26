
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/app_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        left: 14,
        right: 14,
        child: AppButton(
          text: MyText.save,
          loading: context.watch<UserCubit>().state is UserLoading,
          onTap: () => context.read<UserCubit>().update(context),
        ));
  }
}
