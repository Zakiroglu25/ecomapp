import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/presentation/page/product_page/widgets/savable_delivery_address_item.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../utils/constants/assets.dart';

class CurrentDeliveryAddressItem extends SavableDeliveryAddressItem {
  const CurrentDeliveryAddressItem({Key? key, required this.address})
      : super(
            subTitle: address,
            key: key,
            title: MyText.addCurrentAddress,
            selected: false,
            titleColor: MyColors.brand,
            image: Assets.pngLocationIcon,
            subTitleColor: MyColors.brand);

  final String address;
}
