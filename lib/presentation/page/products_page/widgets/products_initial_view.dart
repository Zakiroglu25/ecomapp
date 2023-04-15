import 'package:flutter/material.dart';

import '../../../../utils/constants/paddings.dart';
import 'lets_search_medicine_widget.dart';
import 'pasha_card.dart';

class ProductsInitialView extends StatelessWidget {
  const ProductsInitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16 + Paddings.paddingB12,
      child: Column(
        children: const [
          Spacer(),
          LetsSearchMedicineWidget(),
          Spacer(),
          PashaCardWidget()
        ],
      ),
    );
  }
}
