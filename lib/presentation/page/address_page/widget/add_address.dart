import 'package:flutter/material.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/delegate/pager.dart';
import '../../../../widgets/custom/app_button.dart';
import '../../../../widgets/custom/text_title_big.dart';
import '../../../../widgets/general/empty_widget.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BigSection(
            title: 'Ünvanlarım',
          ),
          Spacer(),
          EmptyWidget(
            imageUrl: Assets.location3x,
            text: "Bura doşdur",
            description:
                "Axtardığınız məhsulu tapmaq üçün, zəhmət olmasa məhsullar bölməsinə keçin",
            color: MyColors.gold,
          ),
          Spacer(),
          AppButton(
            onTap: () {
              Go.to(context, Pager.addAddress());
            },
            text: "+ Yeni ünvan yarat",
          )
        ]),
      ),
    );
  }
}
