import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';

class StaticDeliveryWidget extends StatelessWidget {
  const StaticDeliveryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Çatdırılma",
          style: TextStyle(
              fontSize: 14,
              color: MyColors.grey158,
              fontFamily: "San Francisco"),
        ),
        MySizedBox.h4,
        Container(
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: MyColors.grey245),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "1-3 saat ərzində",
                  style: AppTextStyles.sfPro400s16,
                ),
              )),
        ),
        MySizedBox.h16,
      ],
    );
  }
}
