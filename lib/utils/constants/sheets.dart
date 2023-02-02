import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/delivery_address_current/delivery_address_current_cubit.dart';
import 'package:uikit/infrastructure/services/navigation_service.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/saved_address_list.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/sheet.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';

import '../../infrastructure/cubit/address/address_cubit.dart';
import '../../presentation/page/medicines_page/widgets/current_delivery_address_button.dart';
import '../../presentation/page/medicines_page/widgets/sheet_add_new_address_button.dart';
import 'durations.dart';

class Sheets {
  Sheets._();

  static final context =
      NavigationService.instance.navigationKey?.currentContext;

  static homeAddresses(BuildContext prevContext) => Sheet.display(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddressCubit()..fetch()),
          BlocProvider(
              create: (context) => DeliveryAddressCurrentCubit()..get()),
        ],
        child: Builder(builder: (context) {
          return FocusDetector(
            onFocusLost: () =>
                prevContext.read<AddressCubit>().fetchMainAddress(),
            child: AnimatedSize(
              duration: Durations.ms200,
              child: Container(
                padding: Paddings.paddingA16,
                child: ListView(
                  shrinkWrap: true,
                  // physics: Physics.never,
                  //    crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigSection(title: MyText.deliveryAddresses),
                    MySizedBox.h16,
                    const CurrentDeliveryAddressButton(),
                    const SavedAddressList(),
                    MySizedBox.h16,
                    SheetAddNewAddressButton()
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      context: context!);
}
