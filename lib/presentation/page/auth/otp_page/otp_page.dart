import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/otp/index.dart';
import 'package:uikit/presentation/page/auth/otp_page/widgets/otp_login_button.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/custom/app_safe_area.dart';

import '../../../../widgets/general/app_loading.dart';
import '../../../../widgets/main/otp_view/otp_view.dart';
import 'widgets/otp_pin_code_field.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key, required this.showBackButton}) : super(key: key);
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        body: BlocConsumer<OTPCubit, OtpState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OtpInProgress) {
              return AppLoading();
            }
            return OTPView(
                showBackButton: showBackButton,
                button: OtpLoginButton(showLogOutButton: !showBackButton),
                pinField: OtpPinCodeField());
          },
        ),
      ),
    );
  }
}
