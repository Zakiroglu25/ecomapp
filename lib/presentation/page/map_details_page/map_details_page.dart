import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/map_medicine.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../cart_delivery_page/widgets/delivery_products.dart';
import 'widget/map_details_header.dart';

class MapDetailsPage extends StatelessWidget {
  final MapMedicine? maps;

  MapDetailsPage(this.maps, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      barColor: MyColors.green235,
      backColor: MyColors.green235,
      showAppbarLittleText: true,
      user: false,
      notification: false,
      slivers: [
        MapDetailsHeaders(
          maps: maps!,
        ),
        DeliveryProducts()
      ],
    );
  }
}
