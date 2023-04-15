import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_state.dart';
import 'package:uikit/infrastructure/cubit/otp/index.dart';
import 'package:uikit/presentation/page/auth/otp_page/widgets/otp_login_button.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/custom/app_safe_area.dart';
import '../../../../widgets/main/otp_view/otp_view.dart';
import '../../../infrastructure/cubit/insurance_otp_cubit/insurance_otp_cubit.dart';
import '../../../infrastructure/cubit/insurance_otp_cubit/insurance_otp_state.dart';
import 'widgets/insurance_otp_button.dart';
import 'widgets/otp_pin_code_field.dart';

class InsuranceOTPPage extends StatelessWidget {
  const InsuranceOTPPage({Key? key, required this.showBackButton})
      : super(key: key);
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        body: BlocConsumer<InsuranceOtpCubit, InsuranceOtpState>(
          listener: (context, state) {
            if (state is InsuranceError) {
              Snack.showOverlay(context: context, message: "");
            }
          },
          builder: (context, state) {
            // if (state is InsuranceLoading) {
            //   return AppLoading();
            // }
            return OTPView(
                showBackButton: showBackButton,
                button: InsuranceOtpButton(showLogOutButton: !showBackButton),
                pinField: const OtpPinCodeField());
          },
        ),
      ),
    );
  }
}
