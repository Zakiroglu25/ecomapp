import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uikit/infrastructure/cubit/delivery_address_current/delivery_address_current_cubit.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/items/savable_delivery_address_item.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/alert.dart';

import '../../../../../infrastructure/cubit/delivery_address_current/delivery_address_current_state.dart';
import '../../../../../utils/constants/assets.dart';

class CurrentDeliveryAddressItem extends SavableDeliveryAddressItem {
  CurrentDeliveryAddressItem(
      {Key? key, required this.address, required this.context})
      : super(
            subTitle: address,
            key: key,
            title: MyText.addCurrentAddress,
            selected: false,
            titleColor: MyColors.brand,
            image: Assets.pngLocationIcon,
            subTitleColor: MyColors.brand,
            onTap: () async {
              final state = context.read<DeliveryAddressCurrentCubit>().state;
              if (state is DeliveryAdressCurrentDisabled) {
                // Go.pop(context);
                // Alert.show(
                //   context,
                //   title: MyText.we_need_access_to_locatoin,
                //   content: MyText.we_will_redirect_to_settings_locatoin,
                //   buttonText: MyText.goOn,
                // );
              }
              if ((state is DeliveryAddressCurrentError)) {
                context.read<DeliveryAddressCurrentCubit>().get();
                return;
              }
              context.read<DeliveryAddressCurrentCubit>().add(context);
              // context.read<AddressCubit>().fetchMainAddress();
            });

  final String address;
  final BuildContext context;
}
