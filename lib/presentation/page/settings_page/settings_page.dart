import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';

import '../../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../language_page/change_launguage_page.dart';
import 'widget/change_password.dart';
import 'widget/edit_field_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      onBack: () => Go.pop(context),
      notification: false,
      user: false,
      title: MyText.settings,
      child: Padding(
        padding: Paddings.paddingH16 + Paddings.paddingV16,
        child: SpacedColumn(
          space: 16,
          children: [
            // EditFieldWidget(
            //   onTap: () {
            //     Go.to(context, ChangeNumberPage());
            //   },
            //   headText: "Nömrəniz",
            //   subTitle: "Mövcud nömrəniz",
            //   title: _prefs.user.phone,
            //   png: false,
            //   switchW: false,
            //   sufixImageUrl: Assets.svgCallDark,
            //   prefixImageUrl: SvgPicture.asset(Assets.svgEdit),
            // ),
            //  MySizedBox.h16,
            EditFieldWidget(
              onTap: () {
                Go.to(context, ChangePassword());

                ///sifreni deyis
              },
              headText: "Təhlükəsizlik",
              title: "Şifrəni dəyiş",
              switchW: false,
              prefixImageUrl: Icon(
                Icons.navigate_next,
                color: MyColors.grey158,
              ),
            ),
            //  MySizedBox.h16,
            ///dil secimi novbeti update
            // EditFieldWidget(
            //   onTap: () {
            //     Go.to(context, LanguagePage());
            //   },
            //   headText: "Dil seçimi",
            //   title: "Azərbaycan",
            //   sufixImageUrl: Assets.pngAzFlag,
            //   switchW: false,
            //   prefixImageUrl: Icon(
            //     Icons.navigate_next,
            //     color: MyColors.grey158,
            //   ),
            // ),
            //MySizedBox.h16,
            // EditFieldWidget(
            //   headText: "Bildirişlər",
            //   title: "Bildirişləri aktivləşdir",
            //   //sufixImageUrl: Assets.pngAzFlag,
            //   png: false,
            //   switchW: false,
            // ),

            EditFieldWidget(
              headText: MyText.account,
              title: MyText.deleteAccount,
              // sufixImageUrl: Assets.pngAzFlag,
              png: false,
              switchW: false,
              onTap: () =>
                  context.read<AuthenticationCubit>().showDeleteDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
