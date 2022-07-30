import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/screen/resizable_content.dart';
import 'widgets/log_reg_buttons.dart';
import 'widgets/login_fields.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResizableContent(
        footer: Padding(
          padding: Paddings.paddingH16,
          child: LogRegButtons(),
        ),
        child: FadeInUp(
          duration: Duration(milliseconds: 400),
          child: ListView(
            children: [
              MySizedBox.h50,
              LoginHeaders(),
              MySizedBox.h32,
              LoginFields(),
            ],
          ),
        ));
  }
}
