import 'package:flutter/material.dart';

import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'tabs/insurance_num_tab/insurance_num_tab.dart';

class AddAsanInsuranceInfo extends StatelessWidget {
  AddAsanInsuranceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      notification: false,
      user: false,
      title: "Sigorta elave et",
      child: InsuranceNumTab(),
    );
  }
}
