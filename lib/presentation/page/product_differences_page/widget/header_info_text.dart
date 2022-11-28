import 'package:flutter/material.dart';

import '../../../../infrastructure/model/response/product_option_details_model.dart';
import '../../../../utils/constants/colors.dart';

class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetails? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: MyColors.red250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.info_outline),
          SizedBox(width: 270, child: Text(product!.slug!)),
          Icon(Icons.clear)
        ],
      ),
    );
  }
}
