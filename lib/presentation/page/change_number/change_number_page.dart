import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_field.dart';
import '../settings_page/widget/edit_field_widget.dart';

class ChangeNumberPage extends StatelessWidget {
  const ChangeNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: false,
        notification: false,
        filter: false,
        title: 'Nömrəni dəyiş',
        contextA: null,
      ),
      body: ListView(
        padding: Paddings.paddingH16,
        children: [
          EditFieldWidget(
            headText: "Nömrəniz",
            subTitle: "Mövcud nömrəniz",
            title: "+994 50 805 05 20",
            png: false,
            switchW: false,
            sufixImageUrl: Assets.svgCallDark,
            // prefixImageUrl: SvgPicture.asset(Assets.svgEdit),
          ),
          MySizedBox.h16,
          AppField(
            title: 'Yeni nömrə',
            hint: 'Yeni nömrənizi daxil edin',
          ),
          AppField(
            title: 'Şifrə',
            hint: 'Şifrəni daxil edin',
          )
        ],
      ),
    );
  }
}
