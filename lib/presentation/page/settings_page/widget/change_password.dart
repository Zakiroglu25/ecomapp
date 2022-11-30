import 'package:flutter/material.dart';

import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../../widgets/general/app_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Şifrəni dəyiş",
        contextA: context, user: false,
        notification: false,

      ),
      body: ListView(
        children: [
          AppField(
            title: "Köhnə şifrə",
            hint: "Şifrəni daxil edin",
          ),
          AppField(),
          AppField(),
        ],
      ),
    );
  }
}
