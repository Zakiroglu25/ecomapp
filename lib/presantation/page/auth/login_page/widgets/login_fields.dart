import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:flutter/material.dart';

import '../../../../../util/constants/sized_box.dart';
import '../../../../../util/constants/text.dart';
import '../../../../../util/delegate/navigate_utils.dart';
import '../../../../../util/delegate/pager.dart';
import '../../../../../widget/custom/doctoro_text_button.dart';
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
          onTap: () => Go.to(context, Pager.forgot),
        ),
      ],
    );
  }
}
