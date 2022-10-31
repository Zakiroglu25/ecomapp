import 'package:flutter/material.dart';

import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_state.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import 'widget/forgot_main_button.dart';
import 'widget/key_widget.dart';
import 'widget/stepper.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final forgotCubit = context.watch<ForgotPassCubit>();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      // appBar: CaspaAppbar(
      //   contextA: context,
      //   title: '',
      //   user: false,
      //   notification: false,
      // ),
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          padding: Paddings.paddingH20,
          child: Stack(
            children: [
              Column(
                children: [
                  KeyWidget(),
                  MySizedBox.h10,
                  ForgotPassStepper(
                    stepCount: 3, current: 10,
                    // current: forgotCubit.currentIndex,
                  ),
                  BlocBuilder<ForgotPassCubit, ForgotPassState>(
                      buildWhen: (context, state) {
                    if (state is ForgotPassInProgress) {
                      return false;
                    }
                    if (state is ForgotPassError) {
                      return false;
                    } else
                      return true;
                  }, builder: (context, state) {
                    if (state is ForgotPassEnterMail) {
                      return FadeIn(key: Key("a"), child: EnterMailBody());
                    }
                    if (state is ForgotPassEnterCode) {
                      return FadeInRight(
                          duration: Duration(milliseconds: 500),
                          key: Key("b"),
                          child: EnterCodeBody());
                    }
                    if (state is ForgotPassChanged) {
                      return FadeInRight(
                          duration: Duration(milliseconds: 500),
                          key: Key("c"),
                          child: PassChangedBody());
                    } else {
                      return CaspaLoading.blue();
                    }
                  })
                ],
              ),
              const ForgotMainButton()
            ],
          ),
        ),
      ),
    );
  }
}
