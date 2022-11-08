import 'package:flutter/material.dart';

import '../../../../../utils/constants/text.dart';
import '../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../utils/delegate/pager.dart';
import '../../../../../widgets/custom/doctoro_text_button.dart';
import 'pass_field.dart';
import 'phone_field_login.dart';

class LoginFields extends StatelessWidget {
  // static ConfigService get _configs => locator<ConfigService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneFieldLogin(),
        PassField(),
        DoctoroTextButton(
          text: MyText.forgot,
          onTap: () => Go.to(context, Pager.forgotPassword),
        ),
      ],
    );
  }
}
