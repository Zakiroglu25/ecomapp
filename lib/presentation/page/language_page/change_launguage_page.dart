import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../settings_page/widget/edit_field_widget.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: false,
        title: 'Dil seçimi',
        notification: false,
        filter: false,
      ),
      body: ListView(
        padding: Paddings.paddingH16,
        children: [
          MySizedBox.h24,
          EditFieldWidget(
            onTap: () {
              // Go.to(context, LanguagePage());
            },
            // headText: "Dil seçimi",
            title: "Azərbaycan",
            sufixImageUrl: Assets.pngAzFlag,
            switchW: false,
            prefixImageUrl: Icon(
              Icons.navigate_next,
              color: MyColors.grey158,
            ),
          ),
          MySizedBox.h16,
          EditFieldWidget(
            onTap: () {
              // Go.to(context, LanguagePage());
            },
            title: "Русский",
            sufixImageUrl: Assets.pngAzFlag,
            switchW: false,
            prefixImageUrl: Icon(
              Icons.navigate_next,
              color: MyColors.grey158,
            ),
          ),
          MySizedBox.h16,
          EditFieldWidget(
            onTap: () {
              // Go.to(context, LanguagePage());
            },
            // headText: "Dil seçimi",
            title: "English",
            sufixImageUrl: Assets.pngAzFlag,
            switchW: false,
            prefixImageUrl: Icon(
              Icons.navigate_next,
              color: MyColors.grey158,
            ),
          ),
        ],
      ),
    );
  }
}
