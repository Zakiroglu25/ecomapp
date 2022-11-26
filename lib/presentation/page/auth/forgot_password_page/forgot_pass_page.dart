import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_code_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_mail_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_pssword_body.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_state.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/screen/snack.dart';
import 'widget/forgot_back_button.dart';
import 'widget/forgot_main_button.dart';
import 'widget/key_widget.dart';
import 'widget/stepper.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: CaspaAppbar(
      //   contextA: context,
      //   title: '',
      //   user: false,
      //   notification: false,
      // ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ForgotBackButton(),
            Container(
              //color: Colors.red,
              padding: Paddings.paddingH20,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      MySizedBox.h40,
                      KeyWidget(),
                      MySizedBox.h10,
                      ForgotPassStepper(
                        stepCount: 3,
                        //current: 2,
                        current: forgotCubit.currentIndex,
                      ),
                      BlocConsumer<ForgotPassCubit, ForgotPassState>(
                          listener: (context, state) {
                        if (state is ForgotPassSuccess) {
                          Snack.positive(message: MyText.success);
                          Go.andRemove(context, Pager.login);
                        }
                      }, buildWhen: (context, state) {
                        if (state is ForgotPassInProgress) {
                          return false;
                        }
                        if (state is ForgotPassError) {
                          return false;
                        } else
                          return true;
                      }, builder: (context, state) {
                        if (state is ForgotPassEnterMail) {
                          return EnterMailBody();
                        }
                        if (state is ForgotPassEnterCode) {
                          return EnterCodeBody();
                        }
                        if (state is ForgotPassChange) {
                          return EnterPasswordBody();
                        } else {
                          return AppLoading.blue();
                        }
                      })
                    ],
                  ),
                  const ForgotMainButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
