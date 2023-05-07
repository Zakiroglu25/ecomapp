import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import '../../../infrastructure/cubit/insurance_cubit/insurance_state.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/general/list_or_empty.dart';
import 'widget/slidable_item_widget.dart';

class AddInsurancePage extends StatelessWidget {
  const AddInsurancePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: ()=>context.read<InsuranceCubit>().getInsurance(loading: false),
      child: Cupperfold(
        title: MyText.insurance,
        notification: false,
        user: false,
        child: BlocBuilder<InsuranceCubit, InsuranceState>(
          builder: (context, state) {
            if (state is InsuranceSuccess) {
              var insuranceList = state.InsuranceList;
              return Column(
                children: [
                  MySizedBox.h22,
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListOrEmpty(
                      text: MyText.noInsurance,
                      image: Assets.pngInsurance3x,
                      color: MyColors.purpleLight,
                      list: insuranceList.data,
                      description: MyText.goToProductSectionToFindProducts,
                      child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: insuranceList.data.length,
                          itemBuilder: (context, index) {
                            return SlidableWidget(
                              title: insuranceList.data[index].provider!.title,
                              subTitle:
                              insuranceList.data[index].provider!.description,
                              insuranceIcon: Assets.pasha,
                              status: insuranceList.data[index].isValidated,
                              image: insuranceList.data[index].provider!.imageUrl,
                            );
                          }),
                    ),
                  ),
                  MySizedBox.h70,
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppButton(
                      text: "Sığorta əlavə et",
                      onTap: () {
                        Go.to(context, Pager.insurances);
                      },
                    ),
                  )
                ],
              );
            } else if (state is InsuranceProgress) {
              return Center(child: AppLoading());
            } else if (state is InsuranceError) {
              return Center(
                child: Text("Error"),
              );
            }
            return AppLoading();
          },
        ),
      ),
    );
  }
}