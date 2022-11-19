import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/services/hive_service.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/delegate/pager.dart';
import '../../../../utils/screen/ink_wrapper.dart';
import 'user_data_item_widget.dart';

class UserDataBody extends StatelessWidget {
  const UserDataBody({
    Key? key,
    required HiveService prefs,
  })  : _prefs = prefs,
        super(key: key);

  final HiveService _prefs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 166,
              child: Text(
                MyText.userInfo,
                style: AppTextStyles.sfPro600s17,
              ),
            ),
            InkWrapper(
                onTap: () {
                  Go.to(context, Pager.userEdit);
                },
                child: SvgPicture.asset(Assets.svgEditUser))
          ],
        ),
        MySizedBox.h20,
        Row(
          children: [
            Container(
              width: 96.w,
              height: 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.grey288),
              child: Center(
                child: Icon(Icons.person),
              ),
            ),
            MySizedBox.w8,
            Column(
              children: [
                UserDataWidgetItem(
                  title: MyText.name,
                  content: _prefs.user.firstName,
                ),
                UserDataWidgetItem(
                  title: MyText.firstName,
                  content: _prefs.user.lastName,
                ),
              ],
            ),
          ],
        ),
        MySizedBox.h20,
        UserDataWidgetItem(
          title: MyText.birth,
          content: _prefs.user.birthDate,
        ),
        UserDataWidgetItem(
          title: MyText.seriaNum,
          content: _prefs.user.finCode,
        ),
        MySizedBox.h26,
        Row(
          children: List.generate(
              180 ~/ 5,
              (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0
                          ? Colors.transparent
                          : MyColors.grey158,
                      height: 1,
                    ),
                  )),
        ),
        MySizedBox.h16,
        Text(
          "Fin kod nömrəsi",
          style: AppTextStyles.sfPro500s13.copyWith(color: MyColors.grey158),
        ),
        MySizedBox.h2,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "12345678",
              style: AppTextStyles.sfPro600s30,
            ),
            Icon(Icons.copy)
          ],
        ),
      ],
    );
  }
}
