import 'package:flutter/material.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/string_operations.dart';
import '../../../widgets/general/app_field.dart';
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

          ///bunu duzelt birthDate e
          AppField(
            title: MyText.birth,
            hint: _prefs.user.birthDate,
          ),
          AppField(
            title: MyText.seriaNum,
            hint: _prefs.user.insuranceId.toString(),
          ),
          AppField(
            title: MyText.fin,
            hint: _prefs.user.finCode,
          ),
        ],
      ),
    );
  }
}
