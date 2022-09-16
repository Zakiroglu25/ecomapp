import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/delegate/navigate_utils.dart';
import 'package:doctoro/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:doctoro/widgets/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../widgets/custom/app_button.dart';
import 'named_card_widget.dart';

class AddBankCard extends StatelessWidget {
  const AddBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: 'Ödəniş üsulu əlavə et',
        notification: false,
        user: false,
        filter: false,
        contextA: context,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          children: [
            MySizedBox.h26,
            AppField(
              title: "Kart nömrəsi *",
              hint: "Kartın nömrəsini daxil edin",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(Assets.svgCard),
              ),
              suffixIcon: SvgPicture.asset(Assets.svgScan),
            ),
            MySizedBox.h16,
            Row(
              children: [
                Expanded(
                  child: AppField(
                    title: "Bitmə tarixi *",
                    hint: "__/__",
                  ),
                ),
                MySizedBox.w8,
                MySizedBox.w8,
                Expanded(
                  child: AppField(
                    title: "CVC  *",
                    hint: "___",
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                onTap: () {
                  Go.to(context, NamedAndSaveWidget());
                },
                text: "Davam et",
              ),
            ),
            MySizedBox.h16,
          ],
        ),
      ),
    );
  }
}
