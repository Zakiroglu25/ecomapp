import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PashaInsurancePage extends StatelessWidget {
  const PashaInsurancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.pashaBackground,
      appBar: AppBar(
        backgroundColor: MyColors.pashaBackground,
        elevation: 0,
      ),
      body: Padding(
        padding: Paddings.paddingH16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.pngPashaIn3x),
            MySizedBox.h35,
            Text(
              MyText.pashaTitle,
              style: AppTextStyles.sfPro600
                  .copyWith(fontSize: 17, color: MyColors.white),
            ),
            MySizedBox.h30,
            Container(
              height: 167,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.white255),
              child: Padding(
                padding: Paddings.paddingH20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: MyColors.white),
                            child: SizedBox(
                                width: 12,
                                height: 12,
                                child: Image.asset(Assets.pasha)),
                          ),
                          MySizedBox.h4,
                          Text(
                            MyText.downApp,
                            style: AppTextStyles.sfPro600.copyWith(
                                fontSize: 16.sp, color: MyColors.white),
                          ),
                          MySizedBox.h4,
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              MyText.downAppDetails,
                              style: AppTextStyles.sfPro400s14.copyWith(
                                  fontSize: 13.sp, color: MyColors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(Assets.pngPhone3x)
                    ],
                  ),
                ),
              ),
            ),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 167,
                  width: 167.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.white255),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.pngUser3x),
                        MySizedBox.h4,
                        Text(
                          MyText.personalAccount,
                          style: AppTextStyles.sfPro600
                              .copyWith(fontSize: 16.sp, color: MyColors.white),
                        ),
                        MySizedBox.h4,
                        SizedBox(
                          width: 170,
                          child: Text(
                            MyText.personalAccountDetails,
                            style: AppTextStyles.sfPro400s14.copyWith(
                                fontSize: 13.sp, color: MyColors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 167,
                  width: 167.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.white255),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.pngAt3x),
                        MySizedBox.h4,
                        Text(
                          MyText.webSite,
                          style: AppTextStyles.sfPro600
                              .copyWith(fontSize: 16.sp, color: MyColors.white),
                        ),
                        MySizedBox.h4,
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            MyText.webSiteinfo,
                            style: AppTextStyles.sfPro400s14.copyWith(
                                fontSize: 13.sp, color: MyColors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
