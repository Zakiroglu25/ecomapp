import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';

import 'pasha_app_icon.dart';
import 'pasha_app_screenshot.dart';
import 'pasha_insurance_desc_text.dart';
import 'pasha_insurance_title_text.dart';

class PashaAppDownloadWidget extends StatelessWidget {
  const PashaAppDownloadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppElementBox(
      padding: Paddings.paddingH20,
      color: MyColors.white255,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: SpacedColumn(
              space: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PashaAppIcon(),
                PashaInsuranceTitleText(MyText.downApp),
                PashaInsuranceDescText(MyText.downAppDetails),
              ],
            ),
          ),
          Expanded(child: PashaAppScreenshot())
        ],
      ),
    );
  }
}
