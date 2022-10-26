import 'package:flutter/material.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../pasha_insurance_page/pasha_details_page.dart';
import 'pasha_card.dart';

class PashaItem extends StatelessWidget {
  const PashaItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Go.to(context, PashaInsurancePage());
      },
      child: PashaCardWidget(),
    );
  }
}
