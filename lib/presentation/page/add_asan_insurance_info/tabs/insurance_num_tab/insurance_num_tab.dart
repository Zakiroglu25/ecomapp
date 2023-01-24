import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';

import '../../../../../infrastructure/cubit/insurance_cubit/insurance_state.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../widgets/custom/app_button.dart';
import '../../../../../widgets/general/app_field.dart';

class InsuranceNumTab extends StatelessWidget {
  InsuranceNumTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addInsuranceCubit = context.watch<InsuranceCubit>();
    return Padding(
      padding: Paddings.paddingH16,
      child: BlocProvider(
        create: (context) => InsuranceCubit(),
        child: BlocListener<InsuranceCubit, InsuranceState>(
          listener: (context, state) {
            if(state is AddInsuranceSuccess){
              Go.pop(context);
            }
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              MySizedBox.h16,
              AppField(
                controller: addInsuranceCubit.policy,
                title: MyText.insuranceNum,
                maxLines: 1,
                hint: MyText.enterInsuranceNum,
                textInputType: TextInputType.text,
                maxLenght: 16,
                textCapitalization: TextCapitalization.none,
              ),
              AppField(
                controller: addInsuranceCubit.phoneNum,
                title: MyText.phone,
                maxLines: 1,
                hint: MyText.phone_hint,
                textInputType: TextInputType.phone,
                maxLenght: 16,
                textCapitalization: TextCapitalization.none,
              ),
              AppButton(
                loading:
                context
                    .watch<InsuranceCubit>()
                    .state is InsuranceLoading,
                onTap: () {
                  context.read<InsuranceCubit>().addInsurance(context: context);
                },
                text: MyText.save,
              ),
              MySizedBox.h24
            ],
          ),
        ),
      ),
    );
  }
}
