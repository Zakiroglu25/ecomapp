import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../../utils/constants/durations.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/screen/widget_or_empty.dart';
import '../../../../../widgets/custom/app_button.dart';

class SendAgainRow extends StatelessWidget {
  const SendAgainRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return StreamBuilder<int>(
        stream: forgotCubit.countdownTimeStream,
        builder: (context, snapshot) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                WidgetOrEmpty(
                  value: snapshot.data != 0,
                  child: SlideInLeft(
                    duration: Durations.ms100,
                    child: Text('${MyText.sendAgainOtp}: ${snapshot.data}'),
                  ),
                ),
                const Spacer(),
                //if (_showButton)
                WidgetOrEmpty(
                  value: snapshot.data == 0,
                  child: SlideInRight(
                    duration: Durations.ms100,
                    child: AppButton(
                      onTap: () => forgotCubit.requestOTP(context),
                      w: 150,
                      text: MyText.sendAgain,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
