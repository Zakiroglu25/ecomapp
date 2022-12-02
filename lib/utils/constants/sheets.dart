import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_state.dart';
import 'package:uikit/infrastructure/services/navigation_service.dart';
import 'package:uikit/presentation/page/product_page/widgets/current_delivery_address_item.dart';
import 'package:uikit/presentation/page/product_page/widgets/saved_delivery_address_item.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/sheet.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';

import '../../infrastructure/cubit/address/address_cubit.dart';

class Sheets {
  Sheets._();

  static final context =
      NavigationService.instance.navigationKey?.currentContext;

  static get homeAddresses => Sheet.display(
      child: BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: Builder(builder: (context) {
          return Flexible(
            child: Container(
              //   color: MyColors.gold,
              padding: Paddings.paddingA16,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigSection(title: MyText.deliveryAddresses),
                    MySizedBox.h16,
                    CurrentDeliveryAddressItem(address: 'Qara qarayev'),
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        if (state is AddressSuccess) {
                          final addressList = state.addressList;
                          return ListOrEmpty(
                            list: addressList,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: Physics.never,
                              itemBuilder: (context, index) =>
                                  SavedDeliveryAddressItem(
                                address: addressList[index],
                                context: context,
                              ),
                              itemCount: addressList.length,
                            ),
                          );
                        }
                        if (state is AddressError) {
                          return EmptyWidget();
                        }
                        return AppLoading.big();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      context: context!);
}
