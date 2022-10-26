import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/border_radius.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:doctoro/utils/delegate/random.dart';
import 'package:doctoro/widgets/custom/app_tab.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/custom/text_title_big.dart';
import 'package:doctoro/widgets/general/app_element_box.dart';
import 'package:doctoro/widgets/general/doctoro_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/custom/sliver_app_bar_delegate.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
      showAppbarLittleText: true,
      child: Container(
        color: Rndm.color,
      ),
      title: "DeliveryAddress",
      tabbarTitle: SliverAppDelegate(
          child: Padding(
            padding: Paddings.paddingH16 + Paddings.paddingV8,
            child: Text(
              MyText.chooseDeliveryType,
              style: AppTextStyles.sfPro600s16,
            ),
          ),
          maxExtent_: 46),
      headers: SliverPersistentHeader(
          floating: false,
          pinned: false,
          delegate: SliverAppDelegate(
              child: Container(
                //color: MyColors.orange254,
                // height: 90,
                child: Center(
                  child: Container(
                      padding: Paddings.paddingA16,
                      decoration: BoxDecoration(
                          borderRadius: Radiuses.r16,
                          color: MyColors.orange254),
                      child: Image.asset(Assets.pngCourier)),
                ),
              ),
              maxExtent_: 220)),
      tabPages: [
        Container(
          padding: Paddings.paddingA16,
          child: ListView(children: [
            AppField(
              title: MyText.delivery,
            ),
            AppField(
              title: MyText.contactNumber,
            ),
            AppField(
              title: MyText.address,
            ),
            AppField(
              title: MyText.note,
            ),
            SpacedColumn(
              space: 4,
              //shrinkWrap: true,
              children: [
                // SectionName(title: 'title'),
                BigSection(title: 'title'),
                AppElementBox(child: Container()),
              ],
            )
          ]),
        ),
        Container()
      ],
      tabs: [
        AppTab(
          text: "1212",
        ),
        AppTab(
          text: "1212",
        ),
      ],
    );
  }
}
