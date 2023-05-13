import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../../../infrastructure/cubit/insurance_cubit/insurance_state.dart';
import '../../../../../infrastructure/services/hive_service.dart';
import '../../../../../locator.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../utils/formatter/phone_formatter.dart';
import '../../../../../widgets/custom/app_button.dart';
import '../../../../../widgets/general/app_field.dart';
import '../../../../../widgets/general/plus994.dart';

class InsuranceNumTab extends StatelessWidget {
  InsuranceNumTab({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    final addInsuranceCubit = context.watch<InsuranceCubit>();
    if (_prefs.user.finCode != null) {
      addInsuranceCubit.finCodeController.text = _prefs.user.finCode!.toUpperCase();
    }
    return Padding(
      padding: Paddings.paddingH16,
      child: BlocProvider(
        create: (context) => InsuranceCubit(),
        child: BlocListener<InsuranceCubit, InsuranceState>(
          listener: (context, state) {
            if (state is AddInsuranceSuccess) {
              Go.pop(context);
            }
          },
          child: Column(
            //shrinkWrap: true,
            children: [
              MySizedBox.h16,
              AppField(
                controller: addInsuranceCubit.policy,
                title: MyText.insuranceNum,
                maxLines: 1,
                textInputType: TextInputType.phone,
                formatters: [ FilteringTextInputFormatter.digitsOnly],
                textCapitalization: TextCapitalization.none,
                hint: MyText.enterInsuranceNum,
                maxLenght: 16,
              ),
              AppField(
                controller: addInsuranceCubit.phoneNum,
                title: MyText.phone,
                maxLines: 1,
                hint: MyText.phone_hint,
                prefixIcon: Plus994(),
                formatters: [PhoneNumberFormatter()],
                textInputType: TextInputType.phone,
                maxLenght: 16,
                textCapitalization: TextCapitalization.none,
              ),
              AppField(
                controller: addInsuranceCubit.finCodeController,
                title: MyText.fin,
                maxLines: 1,
                hint: MyText.fin,
                textInputType: TextInputType.text,
                maxLenght: 7,
                upperCase: true,
                textCapitalization: TextCapitalization.none,
              ),

              AppButton(
                loading:
                context.watch<InsuranceCubit>().state is InsuranceLoading,
                onTap: () {
                  context.read<InsuranceCubit>().addInsurance(context: context);
                },
                text: MyText.add,
              ),
              MySizedBox.h24
            ],
          ),
        ),
      ),
    );
  }
}