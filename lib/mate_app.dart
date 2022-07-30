import 'package:animations/animations.dart';
import 'package:doctoro/presantation/page/auth/login_page/login_page.dart';
import 'package:doctoro/presantation/page/onboard_page/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'util/constants/colors.dart';
import 'util/constants/text.dart';
import 'util/delegate/scroll_behaivor.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);

  //final botToastBuilder = BotToastInit(); //
  @override
  Widget build(BuildContext context) {
    //bbbb('runnnnning');
    return ScreenUtilInit(
      designSize:const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme:  PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android:
              SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.scaled,
              ),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
                //transitionType: SharedAxisTransitionType.,
              )
              // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
              //  // transitionType: SharedAxisTransitionType.scaled,
              // ),
            },
          ),
          fontFamily: "San Francisco",
          scaffoldBackgroundColor: MyColors.white,
        ),

        home: LoginPage(),
        //Pager.newOrder
        // Pager.shops,
        // Pager.report
        // Pager.payment_balance
      ),
    );
  }
}
