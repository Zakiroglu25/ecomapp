import 'package:flutter/material.dart';

import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'tabs/insurance_num_tab/insurance_num_tab.dart';

class InsurancesPage extends StatelessWidget {
  InsurancesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      notification: false,
      user: false,
      title: "Sığorta əlavə et",
      child: InsuranceNumTab(),
    );
  }
}