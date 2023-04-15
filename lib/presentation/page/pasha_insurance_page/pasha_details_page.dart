import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import '../../../infrastructure/config/init.dart';
import 'widgets/pasha_app_download_widget.dart';
import 'widgets/pasha_cabinet_widget.dart';
import 'widgets/pasha_web_widget.dart';

class PashaInsurancePage extends StatefulWidget {
  const PashaInsurancePage({Key? key}) : super(key: key);

  @override
  State<PashaInsurancePage> createState() => _PashaInsurancePageState();
}

class _PashaInsurancePageState extends State<PashaInsurancePage> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    //   SystemUiOverlay.top
    // ]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: MyColors.blue64,
    // ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColors.blue64
    ));
  }

  @override
  void dispose() {
    super.dispose();
    setAppStatusbarStyle();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);  // to re-show bars
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue64,
      appBar: AppBar(
        backgroundColor: MyColors.blue64,
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
            const PashaAppDownloadWidget(),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PashaCabinetWidget(),
                MySizedBox.w10,
                PashaWebWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
