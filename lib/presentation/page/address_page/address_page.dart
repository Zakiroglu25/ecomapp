import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/address/address_state.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/presentation/page/address_page/widgets/address_widget.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/dividers.dart';
import '../../../utils/constants/durations.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/physics.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/custom/half_empty_widget.dart';
import '../../../widgets/general/list_or_empty.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: MyText.myAddresses,
      user: false,
      notification: false,
      child: FocusDetector(
        onFocusGained: () => context.read<AddressCubit>().fetch(false),
        child:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
          if (state is AddressSuccess) {
            List<Address> addressList = state.addressList;

            return Padding(
              padding: Paddings.paddingH16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    MyText.addresses.toUpperCase(),
                    style: AppTextStyles.sfPro400s14
                        .copyWith(color: MyColors.grey158),
                  ),
                  MySizedBox.h4,
                  ClipRRect(
                    borderRadius: Radiuses.r12,
                    child: Container(
                      height: addressList.isEmpty
                          ? MediaQuery.of(context).size.height / 2
                          : null,
                      decoration: BoxDecoration(
                        borderRadius: Radiuses.r12,
                        color: addressList.isEmpty ? null : MyColors.grey245,
                      ),
                      child: AnimatedSize(
                        duration: Durations.ms100,
                        child: ListOrEmpty(
                          list: addressList,
                          image: Assets.location3x,
                          color: MyColors.orange253,
                          text: MyText.emptyText,
                          description: MyText.emptyTextDesc,
                          child: ListViewSeparated(
                            physics: Physics.never,
                            shrinkWrap: true,
                            padding: Paddings.paddingV16,
                            itemCount: addressList.length,
                            itemBuilder: (context, index) =>
                                AddressWidget(address: addressList[index]),
                            separator: Dividers.h16grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MySizedBox.h50,
                  AppButton(
                    onTap: () => Go.to(context, Pager.addAddress()),
                    text: MyText.addressAdd,
                  ),
                  MySizedBox.h16,
                ],
              ),
            );
          } else if (state is AddressInProgress) {
            return const AppLoading();
          }
          return HalfEmptyWidget(
            imageUrl: Assets.location3x,
            color: MyColors.orange253,
          );
        }),
      ),
    );
  }
}
