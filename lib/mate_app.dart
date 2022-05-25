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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SF Pro Display",
        // scaffoldBackgroundColor: MyColors.white,
      ),
      // title: Configs.appName,
      // navigatorKey: NavigationService.instance.navigationKey,
      //1. call BotToastInit
      // navigatorObservers: [BotToastNavigatorObserver()],
      // navigatorObservers: [ if (Configs.enableSentry) SentryNavigatorObserver(),],
      // theme: ThemeData(
      //     pageTransitionsTheme: PageTransitionsTheme(
      //       builders: <TargetPlatform, PageTransitionsBuilder>{
      //         TargetPlatform.android: SharedAxisPageTransitionsBuilder(
      //           transitionType: SharedAxisTransitionType.scaled,
      //         ),
      //         TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
      //             //transitionType: SharedAxisTransitionType.,
      //             ) // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
      //         //  // transitionType: SharedAxisTransitionType.scaled,
      //         // ),
      //       },
      //     ),
      //     fontFamily: 'CoHeadline',
      //     scaffoldBackgroundColor: MyColors.white),
      home: OnboardPage(),
      //Pager.newOrder
      // Pager.shops,
      // Pager.report
      // Pager.payment_balance
    );
  }
}
