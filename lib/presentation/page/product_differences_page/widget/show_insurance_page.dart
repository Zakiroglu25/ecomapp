import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class ShowInsuranceSwitch extends StatelessWidget {
  const ShowInsuranceSwitch({
    Key? key,
    required this.switchValue,
  }) : super(key: key);

  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Container(
        height: 54.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.grey245,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Sığortalı aptekləri göstər",
              style: AppTextStyles.sfPro400s16.copyWith(),
            ),
            CupertinoSwitch(
              value: switchValue,
              onChanged: (bool value) {
                // setState(() {
                //   switchValue = value;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}
