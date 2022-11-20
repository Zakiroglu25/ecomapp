import 'package:flutter/material.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/delegate/string_operations.dart';
import 'widget/fields/birthday_field.dart';
import 'widget/fields/finField.dart';
import 'widget/fields/name_field.dart';
import 'widget/fields/patronymic_field.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NameFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.firstName),
          ),
          PatronymicFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.lastName),
          ),

          BirthdayFieldUser(
            controller:
                StringOperations.stringToController(_prefs.user.birthDate),
          ),

          FinFieldUser(
              controller:
                  StringOperations.stringToController(_prefs.user.finCode)),

          ///bunu duzelt birthDate e
        ],
      ),
    );
  }
}
