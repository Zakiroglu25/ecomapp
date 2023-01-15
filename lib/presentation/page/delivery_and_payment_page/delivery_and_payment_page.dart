import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/tabs/deliver_and_payment_page_delivery_tab/deliver_and_payment_page_delivery_tab.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/random.dart';
import 'package:uikit/widgets/custom/app_tab.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/custom/sliver_app_bar_delegate.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import 'tabs/i_will_take_tab/i_will_take_tab.dart';
import 'widget/deliver_and_payment_tabbar_title.dart';

class DeliveryAndPaymentPage extends StatelessWidget {
  const DeliveryAndPaymentPage({Key? key, required this.orderGuid})
      : super(key: key);
  final String orderGuid;
  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
      user: false,
      notification: false,
      showAppbarLittleText: true,
      child: Container(color: Rndm.color),
      title: MyText.deliveryAndPayment,
      onChange: (i) =>
          context.read<DeliveryAndPaymentCubit>().fetch(guid: orderGuid),
      tabbarTitle: DeliverAndPaymentTabbarTitle(),
      tabPages: const [DeliverAndPaymentPageDeliveryTab(), IWillTakeTab()],
      tabs: [
        AppTab(text: MyText.delivery),
        AppTab(text: MyText.iWillTakeIt),
      ],
    );
  }
}
