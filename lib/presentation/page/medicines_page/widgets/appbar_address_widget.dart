import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/address/address_state.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/main_address_box.dart';
import 'package:uikit/utils/constants/sheets.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/custom/app_linear_loading.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';

class AppBarAddressWidget extends StatelessWidget {
  const AppBarAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWrapper(
        onTap: () => Sheets.homeAddresses(context),
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is AddressMainSuccess) {
              final address = state.address;
              final isAddressNull = address == null;
              final secondColor =
                  isAddressNull ? MyColors.secondary : MyColors.green235;
              final mainColor = isAddressNull ? MyColors.brand : MyColors.green;
              return MainAddressBox(
                color: secondColor,
                child: Row(
                  //  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: Paddings.paddingR12,
                      child: Icon(
                        Icons.location_on_sharp,
                        color: mainColor,
                      ),
                    ),
                    //MySizedBox.w12,
                    Flexible(
                      child: Text(
                        isAddressNull
                            ? MyText.addressNotSelected
                            : "${address.title}",
                        style: AppTextStyles.sfPro400s14
                            .copyWith(color: mainColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: mainColor,
                    )
                  ],
                ),
              );
            } else if (state is AddressInProgress) {
              return MainAddressBox(
                child: Container(
                    padding: Paddings.paddingV4,
                    child: Center(child: AppLinearLoading.green())),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
