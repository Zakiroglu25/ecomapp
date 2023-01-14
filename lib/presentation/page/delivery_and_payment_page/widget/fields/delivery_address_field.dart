import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/address/address_state.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/main_address_box.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sheets.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/custom/app_linear_loading.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_field.dart';
import 'package:uikit/widgets/general/small_section.dart';
import 'package:uikit/utils/extensions/word.dart';

class DeliveryAddressField extends StatelessWidget {
  const DeliveryAddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => Sheets.homeAddresses(context),
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        space: 4,
        children: [
          SmallSection(
            title: MyText.address,
          ),
          AnimatedSize(
            duration: Durations.ms300,
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is AddressMainSuccess) {
                  final address = state.address;
                  final isAddressNull = address == null;
                  final secondColor =
                      isAddressNull ? MyColors.secondary : MyColors.green235;
                  final mainColor =
                      isAddressNull ? MyColors.brand : MyColors.green;
                  return Column(
                    children: [
                      AppElementBox(
                        color: secondColor,
                        child: Row(
                          //  mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: Paddings.paddingR12,
                              child: Icon(
                                Icons.location_on_sharp,
                                color: mainColor,
                              ),
                            ),
                            //MySizedBox.w12,
                            Expanded(
                              child: Text(
                                isAddressNull
                                    ? MyText.addressNotSelected
                                    : "${address.title}",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // AppField(
                            //   title: MyText.address,
                            //   initialValue: isAddressNull
                            //       ? MyText.addressNotSelected
                            //       : "${address.title}",
                            //   fillColor: secondColor,
                            //   readOnly: true,
                            // ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down, color: mainColor)
                          ],
                        ),
                      ),
                      MySizedBox.h16,
                      AppField(
                        title: MyText.note,
                        initialValue:
                            address?.description?.removeNewLineOperators,
                        maxLines: 1,
                        readOnly: true,
                      ),
                    ],
                  );
                } else if (state is AddressInProgress) {
                  return AppElementBox(
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
        ],
      ),
    );
  }
}
