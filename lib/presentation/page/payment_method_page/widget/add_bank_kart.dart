import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/widgets/custom/doctoro_button.dart';
import 'package:doctoro/widgets/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';

class AddBankCard extends StatelessWidget {
  const AddBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            children: [
              MySizedBox.h16,
              Row(
                children: [
                  Icon(Icons.keyboard_backspace),
                  Spacer(),
                  Text(
                    "Ödəniş üsulu əlavə et",
                    style: AppTextStyles.sfPro600s17,
                  ),
                  Spacer(),
                ],
              ),
              MySizedBox.h26,
              DoctoroField(
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
                    child: DoctoroField(
                      title: "Bitmə tarixi *",
                      hint: "__/__",
                    ),
                  ),
                  MySizedBox.w8,
                  Expanded(
                    child: DoctoroField(
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
                  text: "Davam et",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
