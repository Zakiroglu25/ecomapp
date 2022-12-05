import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/items/savable_delivery_address_item.dart';

class SavedDeliveryAddressItem extends SavableDeliveryAddressItem {
  SavedDeliveryAddressItem(
      {Key? key, required this.address, required this.context})
      : super(
            subTitle: address.description,
            key: key,
            title: address.title,
            onTap: () => context.read<AddressCubit>()
              ..update(address.guid!, address: address..isMain = true),
            selected: address.isMain ?? false);

  final AddressModel address;
  final BuildContext context;
}
