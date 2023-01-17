import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../../../utils/constants/assets.dart';
import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import 'tabs/asan_finans_tab_page/asan_finans_page.dart';
import 'tabs/insurance_num_tab/insurance_num_tab.dart';

class AddAsanInsuranceInfo extends StatelessWidget {
  AddAsanInsuranceInfo({Key? key}) : super(key: key);

  final List<AppTab> tabs = [
    AppTab(
      text: 'Sığorta kart nömrəsi ilə',
      svg: Assets.docu,
      index: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
        notification: false,
        user: false,
        isScrollable: true,
        title: "Sigorta elave et",
        tabPages: [
          InsuranceNumTab(),
        ],
        tabs: tabs);
  }
}