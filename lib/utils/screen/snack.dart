import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/constants/text.dart';

import '../constants/border_radius.dart';
import '../constants/colors.dart';
import '../constants/durations.dart';
import '../constants/paddings.dart';
import 'widget_or_empty.dart';

class Snack {
  // static display({
  //   BuildContext? context,
  //   required String message,
  //   bool positive = false,
  //   bool showSuccessIcon = false,
  //   Color color = MyColors.newGREEN,
  // }) {
  //   //Scaffold.of(context).hideCurrentSnackBar();
  //   // positive ?? false;
  //   final SnackBar snackbar = SnackBar(
  //     key: const Key('a'),
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10))),
  //     dismissDirection: DismissDirection.endToStart,
  //     backgroundColor: Colors.white,
  //     behavior: SnackBarBehavior.floating,
  //     padding: const EdgeInsets.only(right: 0),
  //     content: SnackBody(
  //         message: message,
  //         color: color,
  //         positive: positive,
  //         showSuccessIcon: showSuccessIcon),
  //   );
  //   ScaffoldMessenger.of(
  //       NavigationService.instance.navigationKey!.currentContext!)
  //     ..hideCurrentSnackBar()
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackbar);
  // }

  // static positive({
  //   BuildContext? context,
  //   required String? message,
  //   bool? positive = true,
  //   bool showSuccessIcon = true,
  //   Color color = MyColors.mainGreen85,
  // }) {
  //   //Scaffold.of(context).hideCurrentSnackBar();
  //   //positive ?? false;
  //   final snackBar = SnackBar(
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(borderRadius: Radiuses.r9),
  //     dismissDirection: DismissDirection.horizontal,
  //     backgroundColor: Colors.transparent,
  //     behavior: SnackBarBehavior.floating,
  //     padding: const EdgeInsets.only(right: 0),
  //     content: SnackBody(
  //         message: message ?? MyText.success,
  //         color: color,
  //         positive: true,
  //         showSuccessIcon: showSuccessIcon),
  //   );
  //
  //   ScaffoldMessenger.of(
  //       NavigationService.instance.navigationKey!.currentState!.context)
  //     ..hideCurrentSnackBar()
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }

  static List<Key> listOfKeys = [];

  static positive2(
    BuildContext context, {
    String? message,
    bool positive = true,
    bool showSuccessIcon = true,
    Color color = MyColors.mainGreen85,
  }) {
    showOverlay(
        context: context,
        message: message ?? MyText.success,
        positive: positive,
        color: color,
        showSuccessIcon: showSuccessIcon);
  }

  static error({
    required BuildContext context,
    String? message,
    bool positive = false,
    bool showSuccessIcon = true,
    Color color = MyColors.brand,
  }) {
    showOverlay(
        context: context,
        message: message ?? MyText.error,
        positive: positive,
        color: color,
        showSuccessIcon: showSuccessIcon);
  }

  static bool isShowing = false;

  static showOverlay(
      {required String message,
      required BuildContext context,
      Duration? duration,
      Color color = MyColors.mainGreen85,
      bool? positive = false,
      bool showSuccessIcon = false,
      double? radius}) async {
    //values

    Color backColor = (positive!) ? color : MyColors.brand;
    Duration settedDuration = duration ?? Durations.s5;
    BorderRadius borderRadius = BorderRadius.circular(radius ?? 10);
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      // You can return any widget you like here
      // to be displayed on the Overlay

      return Positioned(
        top: 45,
        left: 0,
        right: 0,
        child: FadeInDown(
          duration: Durations.ms200,
          key: const Key('a'),
          child: Dismissible(
            direction: DismissDirection.vertical,
            key: UniqueKey(),
            onDismissed: (f) {
              overlayEntry?.remove();
              overlayEntry = null;
              // overlayEntry?.remove();
            },
            child: FadeOutUp(
              duration: Durations.ms300,
              key: const Key('a'),
              animate: true,
              // duration: Durations.s1,
              delay: settedDuration,
              child: Center(
                child: Container(
                  margin: Paddings.paddingA16,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: backColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // height: 30,
                  child: Material(
                    color: backColor,
                    borderRadius: borderRadius,
                    elevation: 0,
                    child: SnackBody(
                        message: message,
                        color: color,
                        positive: positive,
                        showSuccessIcon: showSuccessIcon),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });

    // Inserting the OverlayEntry into the Overlay
    if (!isShowing) {
      overlayState?.insert(overlayEntry!);
      isShowing = true;
      await Future.delayed(settedDuration + Durations.s1);

      overlayEntry?.remove();
      isShowing = false;
    } else {
      isShowing = false;
      if (overlayEntry != null) {
        overlayState?.insert(overlayEntry!);
      }
      isShowing = true;
      await Future.delayed(settedDuration + Durations.s1);

      //  if (overlayState != null) {
      overlayEntry?.remove();
      //  }

      isShowing = false;
    }
  }
}

class SnackBody extends StatelessWidget {
  const SnackBody({
    Key? key,
    required this.message,
    this.color = MyColors.mainGreen85,
    this.positive = false,
    this.showSuccessIcon = false,
  }) : super(key: key);

  final String message;
  final Color color;
  final bool positive;
  final bool showSuccessIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (positive) ? color : MyColors.brand,
          borderRadius: Radiuses.r9),
      height: 50.sp,
      // height: 60.sp,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            //color: MyColors.mainColor,
            //margin: EdgeInsets.only(left: (!positive || showSuccessIcon)?50:16),
            padding: EdgeInsets.only(
                left: (!positive || showSuccessIcon) ? 40 : 16,
                right: (!positive || showSuccessIcon) ? 40 : 16),
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: !showSuccessIcon ? 14.sp : 14.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: WidgetOrEmpty(
                  value: (!positive),
                  elseChild: WidgetOrEmpty(
                    value: showSuccessIcon,
                    child: Container(
                      width: 28,
                      child: Row(
                        children: [
                          Flash(
                              child: const Icon(
                            Icons.check_sharp,
                            color: Colors.white,
                          )),
                          //    MySizedBox.w16,
                        ],
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: 28,
                    child: Row(
                      children: [
                        Flash(
                            child: const Icon(
                          Icons.error_outline_sharp,
                          color: Colors.white,
                        )),
                        //     MySizedBox.w8,
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
