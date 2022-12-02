import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/presentation/page/product_page/widgets/savable_delivery_address_item.dart';

class SavedDeliveryAddressItem extends SavableDeliveryAddressItem {
  SavedDeliveryAddressItem({Key? key, required this.address})
      : super(
            subTitle: address.description,
            key: key,
            title: address.title,
            selected: address.isMain ?? false);

  final AddressModel address;
}
