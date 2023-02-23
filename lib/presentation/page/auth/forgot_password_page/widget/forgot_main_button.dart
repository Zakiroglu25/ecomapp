import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../infrastructure/cubit/forgot_pass/forgot_pass_state.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../widgets/custom/app_button.dart';

class ForgotMainButton extends StatelessWidget {
  const ForgotMainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: StreamBuilder<String>(
          stream: BlocProvider.of<ForgotPassCubit>(context).phoneStream,
          builder: (context, snapshot) {
            return AppButton(
              text: forgotCubit.buttonText,
              isButtonActive: snapshot.hasData && snapshot.data?.length == 14,
              loading: (forgotCubit.state is ForgotPassInProgress),
              onTap: () =>
                  context.read<ForgotPassCubit>().changeState(context: context),
            );
          }),
    );
  }
}
