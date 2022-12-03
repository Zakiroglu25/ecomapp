import 'package:flutter/material.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/delegate/string_operations.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import 'widget/fields/birthday_field.dart';
import 'widget/fields/email_field.dart';
import 'widget/fields/finField.dart';
import 'widget/fields/last_name_fiedl.dart';
import 'widget/fields/name_field.dart';
import 'widget/fields/patronymic_field.dart';
import 'widget/fields/seria_field.dart';
import 'widget/save_button.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: 'Edit',
        user: false,
        contextA: context,
        notification: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // PhoneFieldUser(
          //   controller: StringOperations.stringToController(_prefs.user.phone),
          // ),
          EmailFieldUser(
              controller:
                  StringOperations.stringToController(_prefs.user.email)),
          //api
          NameFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.firstName),
          ),
          PatronymicFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.patronymic),
          ),

          LastNameFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.lastName),
          ),

          BirthdayFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.birthDate),
          ),
          SeriaFieldUser(
              controller: StringOperations.stringToController(
                  _prefs.user.idSerialNumber)),

          FinFieldUser(
              controller:
                  StringOperations.stringToController(_prefs.user.finCode)),

          SaveButton()
        ],
      ),
    );
  }
}
