import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_code_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_mail_body.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/widget/enter_pssword_body.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import 'package:uikit/widgets/custom/app_safe_area.dart';
import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import '../../../../infrastructure/cubit/forgot_pass/forgot_pass_state.dart';
import '../../../../utils/constants/boxx.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/screen/snack.dart';
import '../../../../widgets/custom/custom_animated_cross.dart';
import 'widget/forgot_back_button.dart';
import 'widget/forgot_main_button.dart';
import 'widget/key_widget.dart';
import 'widget/stepper.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotCubit = context.watch<ForgotPassCubit>();
    return AppSafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
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
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: context.sH,
                    child: Column(
                      children: [
                        MySizedBox.h40,
                        CustomAnimatedCross(
                            showFirst:
                                MediaQuery.of(context).viewInsets.bottom == 0,
                            duration: Durations.ms200,
                            first: KeyWidget(),
                            second: MySizedBox.h4),
                        MySizedBox.h10,
                        ForgotPassStepper(
                          stepCount: 3,
                          //current: 2,
                          current: forgotCubit.currentIndex,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: BlocConsumer<ForgotPassCubit, ForgotPassState>(
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
                              return EnterCodeBody();
                            }
                            if (state is ForgotPassChange) {
                              return EnterPasswordBody();
                            } else {
                              return AppLoading.blue();
                            }
                          }),
                        ),
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
