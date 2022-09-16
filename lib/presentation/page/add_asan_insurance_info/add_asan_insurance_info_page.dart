import 'package:doctoro/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import '../cart_page/tabs/orders_tab/orders_tab.dart';
import '../cart_page/tabs/waiting_tab/waiting_tab.dart';
import 'tabs/asan_finans_tab_page/asan_finans_page.dart';
import 'tabs/insurance_num_tab/insurance_num_tab.dart';

class AddAsanInsuranceInfo extends StatelessWidget {
  AddAsanInsuranceInfo({Key? key}) : super(key: key);

  final List<AppTab> tabs = [
    AppTab(
      text: 'ASAN Finans ilə',
      svg: Assets.bag_happy_xx,
      index: 0,
    ),
    AppTab(
      text: 'Sığorta kart nömrəsi ilə',
      svg: Assets.docu,
      index: 1,
    ),
    AppTab(
      text: 'Mobiil nömrə ilə',
      svg: Assets.svgCall,
      index: 2,
      color: MyColors.grey158,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
        notification: false,
        user: false,
        isScrollable: true,
        tabPages: [
          AsanFinanceTab(),
          InsuranceNumTab(),
          InsuranceNumTab(),
        ],
        tabs: tabs);
  }
}
