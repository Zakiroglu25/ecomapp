import 'dart:developer';

import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/address/address_state.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/custom/text_title_big.dart';
import 'widget/add_address.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.black),
      ),
      body: FocusDetector(
        onFocusGained: () {
          context.read<AddressCubit>().fetch(false);
        },
        child: SafeArea(
          child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
            if (state is AddressSuccess) {
              List<AddressModel> model = state.addressModel;
              return Padding(
                padding: Paddings.paddingH16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigSection(title: "Ünvanlarım"),
                    MySizedBox.h30,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ÜNVANLAR',
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.grey158),
                        ),
                        MySizedBox.h4,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MyColors.grey245,
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Slidable(
                                  key: ValueKey(0),
                                  endActionPane: ActionPane(
                                    extentRatio: 0.20,
                                    motion: ScrollMotion(),
                                    children: [
                                      SizedBox(
                                        width: 55,
                                        height: 48,
                                        child: Center(
                                          child: SlidableAction(
                                            onPressed: (context) {
                                              context
                                                  .read<AddressCubit>()
                                                  .delete(model[index].guid);
                                            },
                                            backgroundColor: MyColors.darkRED,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: Paddings.paddingH16 +
                                        Paddings.paddingV12,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${model[index].title}",
                                              style: AppTextStyles.sfPro600s16,
                                            ),
                                            Text(
                                              "${model[index].streetName}",
                                              style: AppTextStyles.sfPro400s14,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        InkWrapper(
                                            onTap: () {
                                              Go.to(
                                                  context,
                                                  Pager.addAddress(
                                                      address: model[index]));
                                            },
                                            child: SvgPicture.asset(
                                                Assets.svgEdit))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider();
                            },
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    AppButton(
                      onTap: () {
                        Go.to(context, Pager.addAddress());
                      },
                      text: "+ Yeni ünvan yarat",
                    ),
                    MySizedBox.h16,
                  ],
                ),
              );
            } else if (state is AddressInProgress) {
              return Center(
                child: AppLoading(
                  s: 20,
                ),
              );
            }
            return EmptyAddress();
          }),
        ),
      ),
    );
  }
}
