import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infrastructure/cubit/authentication/authentication_cubit.dart';
import 'infrastructure/services/navigation_service.dart';
import 'utils/constants/colors.dart';
import 'utils/delegate/pager.dart';
import 'utils/delegate/scroll_behaivor.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (context) =>
          AuthenticationCubit()..startApp(context, showSplash: true),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: Configs.appName,
          navigatorKey: NavigationService.instance.navigationKey,
          //1. call BotToastInit
          // navigatorObservers: [BotToastNavigatorObserver()],
          // navigatorObservers: [ if (Configs.enableSentry) SentryNavigatorObserver(),],
          theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: SharedAxisPageTransitionsBuilder(
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
              fontFamily: 'sf',
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'sf',
                  ),
              scaffoldBackgroundColor: MyColors.white),
          builder: (context, widget) {
            // ScreenUtil.setContext(context);
            // widgets = BotToastInit().call(context, widgets);
            //  widgets = botToastBuilder(context,widgets);
            return ScrollConfiguration(
                behavior: ScrollBehaviorModified(), child: widget!);
          },
          home: Builder(
            builder: (ctx) {
              return Pager.app();
            },
          )),
    );
  }
}
