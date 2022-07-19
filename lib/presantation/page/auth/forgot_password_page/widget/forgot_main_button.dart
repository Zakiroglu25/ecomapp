
import 'package:doctoro/util/constants/text.dart';
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotMainButton extends StatelessWidget {
  const ForgotMainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final forgotCubit = context.watch<ForgotPassCubit>();
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: StreamBuilder(
        // stream: BlocProvider.of<ForgotPassCubit>(context).phoneStream,
        builder: (context, snapshot) {
          return DoctoroButton(
            text: MyText.login,
            isButtonActive: snapshot.hasData,
            // loading: (forgotCubit.state is ForgotPassInProgress),
            onTap: () {
              // context.read<ForgotPassCubit>().changeState(context: context);
            },
          );
        }
      ),
    );
  }
}
