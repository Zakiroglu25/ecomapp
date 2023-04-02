import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'widget/card_body.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Cupperfold(
      //onBack: () => Go.pop(context),
      notification: false,
      user: false,
      title: MyText.paymentType,
      child: CardBody(),
    );
  }
}
