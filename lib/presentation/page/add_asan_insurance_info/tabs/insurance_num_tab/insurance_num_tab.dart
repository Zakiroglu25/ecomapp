import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/paddings.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/custom/app_button.dart';
import '../../../../../widgets/general/app_field.dart';

class InsuranceNumTab extends StatelessWidget {
  const InsuranceNumTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: Column(
        children: [
          MySizedBox.h16,
          AppField(
            title: "FIN kod",
            hint: "Daxil edin",
          ),
          AppField(
            title: "Kart nömrəsini daxil edin",
            hint: "Daxil edin",
          ),
          Spacer(),
          AppButton(
            text: MyText.save,
          ),
          MySizedBox.h24
        ],
      ),
    );
  }
}
