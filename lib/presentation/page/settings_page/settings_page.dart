import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../change_number/change_number_page.dart';
import '../language_page/change_launguage_page.dart';
import 'widget/edit_field_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      onBack: () => Go.pop(context),
      notification: false,
      user: false,
      title: 'Tənzimləmələr',
      child: Padding(
        padding: Paddings.paddingH16 + Paddings.paddingV16,
        child: Column(
          children: [
            EditFieldWidget(
              onTap: () {
                Go.to(context, ChangeNumberPage());
              },
              headText: "Nömrəniz",
              subTitle: "Mövcud nömrəniz",
              title: "+994 50 805 05 20",
              png: false,
              switchW: false,
              sufixImageUrl: Assets.svgCallDark,
              prefixImageUrl: SvgPicture.asset(Assets.svgEdit),
            ),
            MySizedBox.h16,
            const EditFieldWidget(
              headText: "Təhlükəsizlik",
              title: "Şifrəni dəyiş",
              switchW: false,
              prefixImageUrl: Icon(
                Icons.navigate_next,
                color: MyColors.grey158,
              ),
            ),
            MySizedBox.h16,
            EditFieldWidget(
              onTap: () {
                Go.to(context, LanguagePage());
              },
              headText: "Dil seçimi",
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
              headText: "Bildirişlər",
              title: "Bildirişləri aktivləşdir",
              sufixImageUrl: Assets.pngAzFlag,
              png: false,
              switchW: false ,
            ),
            
          ],
        ),
      ),
    );
  }
}
