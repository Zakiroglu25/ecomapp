import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_build.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
        designSize: Size(375, 812), builder: MainBuild.build);
  }
}
