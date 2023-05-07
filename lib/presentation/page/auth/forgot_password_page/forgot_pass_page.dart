import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_code_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_mail_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_pssword_body.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/custom/app_safe_area.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_state.dart';
import '../../../../infrastructure/cubit/otp/otp_cubit.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/screen/snack.dart';
import 'widget/forgot_back_button.dart';
import 'widget/forgot_main_button.dart';
import 'widget/key_widget.dart';
import 'widget/stepper.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  int _countdownTime = 60;
  bool _showButton = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdownTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownTime > 0) {
          _countdownTime--;
        } else {
          _showButton = true;
          _timer.cancel();
        }
      });
    });
  }

  void _restartCountdown() {
    setState(() {
      _countdownTime = 60;
      _showButton = false;
    });
    _startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    // bbbb(
    //     "MediaQuery.of(context).viewInsets.bottom; ${MediaQuery.of(context).viewInsets.bottom}");
    return AppSafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: CaspaAppbar(
          //   contextA: context,
          //   title: '',
          //   user: false,
          //   notification: false,
          // ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: Paddings.paddingH20,
                child: AnimatedSlide(
                  offset: MediaQuery.of(context).viewInsets.bottom == 0
                      ? const Offset(0.0, 0)
                      : const Offset(0.0, -0.05),
                  duration: Durations.ms200,
                  child: SizedBox(
                    height: context.sH
                        //+ 40
                        -
                        MediaQuery.of(context).viewInsets.bottom,
                    child: Column(
                      //shrinkWrap: true,
                      children: [
                        MySizedBox.h40,
                        const KeyWidget(),
                        MySizedBox.h10,
                        ForgotPassStepper(
                          stepCount: 3,
                          //current: 2,
                          current: forgotCubit.currentIndex,
                        ),
                        BlocConsumer<ForgotPassCubit, ForgotPassState>(
                            listener: (context, state) {
                          if (state is ForgotPassSuccess) {
                            Snack.positive2(context, message: MyText.success);
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
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EnterCodeBody(),
                                Row(
                                  children: [
                                      Text(
                                          'Şifrəni yenidən göndər: $_countdownTime'),
                                    Spacer(),
                                    if (_showButton)
                                      AppButton(
                                        onTap: () {
                                        },
                                        w: 150,
                                        h: 30,
                                        text: 'Yenidən göndər',
                                      ),
                                  ],
                                ),
                              ],
                            );
                          }
                          if (state is ForgotPassChange) {
                            return EnterPasswordBody();
                          } else {
                            return const AppLoading();
                          }
                        }),
                        // const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

              //  Boxx(),
              const ForgotMainButton(),
              const ForgotBackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
