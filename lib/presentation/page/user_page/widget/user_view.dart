import 'package:flutter/material.dart';

import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../utils/constants/colors.dart';
import 'user_data_body.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: MyColors.white),
          width: 311,
          height: 425,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: UserDataBody(prefs: _prefs),
          ),
        ),
      ],
    );
  }
}
