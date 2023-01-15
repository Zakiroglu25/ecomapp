import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import 'package:uikit/presentation/page/add_asan_insurance_info/tabs/insurance_num_tab/fields/phone_number_field.dart';

import '../../../../../infrastructure/cubit/insurance_cubit/insurance_state.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';
import '../../../../../widgets/general/app_field.dart';
import 'fields/policy_num_field.dart';

class InsuranceNumTab extends StatelessWidget {
  InsuranceNumTab({Key? key}) : super(key: key);
  TextEditingController? policyController = TextEditingController();
  TextEditingController? phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: BlocProvider(
        create: (context) => InsuranceCubit(),
        child: BlocListener<InsuranceCubit, InsuranceState>(
          listener: (context, state) {
            if (state is AddInsuranceSuccess) {
              print("Elave olundu");
            }else if(state is InsuranceError){
              print("Elave olunmadi");

            }
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              MySizedBox.h16,
              PolicyField(
                controller: policyController!,
              ),
              PhoneField(
                controller: phonecontroller!,
              ),
              Spacer(),
              AppButton(
                loading: context.watch<InsuranceCubit>().state is InsuranceLoading,
                onTap: () {
                  context.read<InsuranceCubit>().addInsurance(context);
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