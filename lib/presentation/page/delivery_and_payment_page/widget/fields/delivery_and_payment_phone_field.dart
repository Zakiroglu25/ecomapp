import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/services/hive_service.dart';
import 'package:uikit/locator.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/number.dart';
import 'package:uikit/utils/formatter/phone_formatter.dart';
import 'package:uikit/widgets/general/app_field.dart';

class DeliveryAndPaymentPhoneField extends StatelessWidget {
  const DeliveryAndPaymentPhoneField({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return AppField(
      title: MyText.contactNumber,
      initialValue: _prefs.user.phone.formatWith070,
      hint: MyText.contactNumber,
      textInputType: TextInputType.phone,
      formatters: [PhoneNumberFormatter(with994: false)],
      maxLenght: 15,
      readOnly: true,
      // prefixIcon: Plus994(),
    );
  }
}
