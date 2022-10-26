import 'dart:developer';

import 'package:doctoro/infrastructure/cubit/address/address_cubit.dart';
import 'package:doctoro/infrastructure/cubit/address/address_state.dart';
import 'package:doctoro/infrastructure/model/response/address_model.dart';
import 'package:doctoro/widgets/general/app_loading.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
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
import '../../../utils/delegate/my_printer.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/custom/text_title_big.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    log(_prefs.accessToken.toString());

    ///burda Cupperfold ishledib, buttonu ashagiya qoymaq olmur
    ///[log] eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJkb2N0b3JvIiwiYXVkIjoiZG9jdG9ybyIsInN1YiI6ImRjODA5ZDQ2LTYxMTItNDM1ZS05NzAzLTJkYmVjYjJlZDlhMCIsImN1c3RvbWVyR3VpZCI6ImRjODA5ZDQ2LTYxMTItNDM1ZS05NzAzLTJkYmVjYjJlZDlhMCIsImlzVGVtcCI6ZmFsc2UsImV4cCI6MTY2NjAwNDkyOX0.eLGPq4v3eZ1nNtd4oJ8cK3S4owN5QC16yOEqkw7qQgzBT99WpLcwufS-aJwVvU5jMGqswajeevLsHZ2PuES6CQ
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.black),
      ),
      body: SafeArea(
        child:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
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
                                          onPressed: null,
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
                                  padding:
                                      Paddings.paddingH16 + Paddings.paddingV12,
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
                                      SvgPicture.asset(Assets.svgEdit)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  AppButton(
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
          return Text("");
        }),
      ),
    );
  }
}
