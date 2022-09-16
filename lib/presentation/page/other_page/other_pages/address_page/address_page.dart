import 'package:doctoro/infrastructure/cubit/address/address_cubit.dart';
import 'package:doctoro/infrastructure/cubit/address/address_state.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/widgets/custom/app_button.dart';
import 'package:doctoro/widgets/general/app_loading.dart';
import 'package:doctoro/widgets/general/empty_widget.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants/assets.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
        title: 'Ünvanlarım',
        child:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
          if (state is AddressSuccess) {
            return Center(
              child: Text("Address Tapildi"),
            );
          } else if (state is AddressInProgress) {
            return AppLoading();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmptyWidget(
                color: MyColors.orange253,
                imageUrl: Assets.location3x,
                text: "Bura Bosdur",
                description:
                    "Axtardığınız məhsulu tapmaq üçün,zəhmət olmasa məhsullar bölməsinə keçin",
              ),
              AppButton(),
            ],
          );
        }));
  }
}
