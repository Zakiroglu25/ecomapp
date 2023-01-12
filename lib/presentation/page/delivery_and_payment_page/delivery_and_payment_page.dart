import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/cash_payment_box.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/widget/fields/delivery_address_field.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/random.dart';
import 'package:uikit/widgets/custom/app_tab.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/dividers.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/custom/sliver_app_bar_delegate.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import 'widget/cards_view.dart';
import 'widget/static_delivery_field.dart';

class DeliveryAndPaymentPage extends StatelessWidget {
  const DeliveryAndPaymentPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
      user: false,
      notification: false,
      showAppbarLittleText: true,
      child: Container(color: Rndm.color),
      title: MyText.deliveryAndPayment,
      tabbarTitle: SliverAppDelegate(
          child: Padding(
            padding: Paddings.paddingH16 + Paddings.paddingV8,
            child: const Text(
              MyText.chooseDeliveryType,
              style: AppTextStyles.sfPro600s16,
            ),
          ),
          maxExtent_: 36),
      tabPages: [
        ///tab1
        Container(
          padding: Paddings.paddingA16,
          child: ListView(physics: Physics.never, children: [
            const StaticDeliveryWidget(),
            AppField(
              title: MyText.contactNumber,
              initialValue: _prefs.user.phone,
              hint: MyText.contactNumber,
            ),
            BigSection(
              title: MyText.address,
              size: 16.sp,
            ),
            MySizedBox.h24,
            DeliveryAddressField(),
            MySizedBox.h16,
            AppField(
              title: MyText.note,
            ),
            BigSection(
              title: MyText.payment,
              size: 16.sp,
            ),
            MySizedBox.h24,
            AppElementBox(
              padding: Paddings.paddingA20,
              child: SpacedColumn(
                space: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        MyText.orders,
                        style: AppTextStyles.sfPro400s16,
                      ),
                      Text("142.20 ₼"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        MyText.deliveryPrice,
                        style: AppTextStyles.sfPro400s16,
                      ),
                      Text("16.10 ₼"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          MyText.total,
                          style: AppTextStyles.sfPro400s16,
                        ),
                      ),
                      Expanded(
                        child: AppButton.black(
                          h: 36,
                          fitText: true,
                          text: '1 223.20  ₼',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MySizedBox.h24,
            Text(
              MyText.cards,
              style:
                  AppTextStyles.sfPro400s12.copyWith(color: MyColors.grey158),
            ),
            MySizedBox.h4,
            AppElementBox(
              padding: Paddings.paddingA16,
              child: SpacedColumn(
                space: 16,
                children: [CardsView(), Dividers.h1grey, CashPaymentBox()],
              ),
            )
          ]),
        ),

        ///tab2
        const Text("Salam")
      ],
      tabs: [
        AppTab(
          text: "Çatdırılma",
        ),
        AppTab(
          text: "Özüm götürəcəm",
        ),
      ],
    );
  }
}
