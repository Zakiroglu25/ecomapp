import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pasha_insurance_desc_text.dart';
import 'pasha_insurance_title_text.dart';

class PashaWebWidget extends StatelessWidget {
  const PashaWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          launch("https://www.pasha-insurance.az/az");
        },
        child: AppElementBox(
          padding: Paddings.paddingA20,
          color: MyColors.white255,
          child: SpacedColumn(
            space: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.pngAt3x),
              const PashaInsuranceTitleText(MyText.webSite),
              const PashaInsuranceDescText(MyText.webSiteinfo),
            ],
          ),
        ),
      ),
    );
  }
}
