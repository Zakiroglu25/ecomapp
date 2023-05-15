// Flutter imports:

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/durations.dart';
import '../constants/paddings.dart';
import '../screen/widget_or_empty.dart';

// Project imports:
//
class Snack2 {
  Snack2._();

  // static showProgress({
  //   required BuildContext context,
  //   //required double percent,
  //   int? total,
  //   int? uploaded,
  // }) {
  //   var snackbar = SnackBar(
  //     backgroundColor: MyColors.mainGreen85,
  //     content: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Builder(builder: (context) {
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               "$uploaded/$total",
  //               style: const TextStyle(color: MyColors.white),
  //             ),
  //             Container(
  //               width: MediaQuery.of(context).size.width - 80,
  //               child: const LinearProgressIndicator(
  //                 backgroundColor: MyColors.mainGreen85,
  //                 color: MyColors.blue55,
  //               ),
  //             )
  //           ],
  //         );
  //       }),
  //     ),
  //     duration: const Duration(days: 365),
  //   );
  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackbar);
  // }

//   static display(
//       {required BuildContext context,
//       String message = MyText.error,
//       bool positive = false,
//       bool showSuccessIcon = false,
//       bool ignorePointer = false,
//       bool onTop = false,
//       Duration duration = Durations.s4,
//       double textSize = 16.0,
//       Widget? button}) {
//     //Scaffold.of(context).hideCurrentSnackBar();
//     //positive ?? false;
//
//     textSize = !showSuccessIcon ? 14 : 16;
//     int number = StringOperations.getLineNumber(context,
//         text: message,
//         textSize: textSize,
//         paddingW: (((!positive || showSuccessIcon) ? 40 : 16) +
//             (((!positive || showSuccessIcon) && button == null) ? 40 : 16)));
//     //bbbb("numbers: $number");
//     final snackbar = SnackBar(
//       elevation: 2,
//       duration: duration,
//       dismissDirection: DismissDirection.horizontal,
//       backgroundColor: Colors.transparent,
//       behavior: onTop ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
//       padding: const EdgeInsets.only(right: 0),
//       margin: onTop
//           ? EdgeInsets.only(
//               bottom: MediaQuery.of(context).size.height - 100,
//               right: 20,
//               left: 20)
//           : null,
//       content: Container(
//         height: (number + 1.8) * textSize,
//         decoration: BoxDecoration(
//           //color: MyColors.mainColor,
//           color: (positive) ? MyColors.mainColor : MyColors.errorRED,
//           // gradient: (positive??false) ? Gradients.gBlues : Gradients.gReds,
//           //    borderRadius: BorderRadius.circular(5)
//         ),
// //        height: 56,
//         child: Stack(
//           fit: StackFit.passthrough,
//           children: [
//             Container(
//               //color: MyColors.mainColor,
//               //margin: EdgeInsets.only(left: (!positi ve || showSuccessIcon)?50:16),
//               padding: EdgeInsets.only(
//                   left: (!positive || showSuccessIcon) ? 40 : 16,
//                   right: ((!positive || showSuccessIcon) && button == null)
//                       ? 40
//                       : 16),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     //   Spacer(),
//                     // MySizedBox.w20,
//                     Flexible(
//                       child: Text(
//                         message,
//                         textAlign: TextAlign.center,
//                         maxLines: 3,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: textSize),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     button != null
//                         ? Row(
//                             children: [MySizedBox.w5, button],
//                           )
//                         : Container(),
//
//                     // Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//             ConstrainedBox(
//               constraints: const BoxConstraints(
//                 minHeight: 35.0,
//                 maxHeight: 40.0,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: WidgetOrEmpty(
//                       value: (!positive),
//                       elseChild: WidgetOrEmpty(
//                         value: showSuccessIcon,
//                         child: Container(
//                           width: 28,
//                           child: Row(
//                             children: const [
//                               Icon(
//                                 Icons.check_sharp,
//                                 color: Colors.white,
//                               ),
//                               //    MySizedBox.w16,
//                             ],
//                           ),
//                         ),
//                       ),
//                       child: Container(
//                         width: 28,
//                         child: Row(
//                           children: const [
//                             Icon(
//                               Icons.error_outline_sharp,
//                               color: Colors.white,
//                             ),
//                             //     MySizedBox.w8,
//                           ],
//                         ),
//                       )),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//
//     // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
//     //     content: Container(
//     //   color: MyColors.green,
//     // )));
//     //
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackbar);
//   }

  // static success(
  //     {BuildContext? context,
  //     String? message,
  //     bool positive = true,
  //     bool showSuccessIcon = true,
  //     bool ignorePointer = false,
  //     bool onTop = false,
  //     Duration duration = Durations.s4,
  //     double textSize = 16.0,
  //     Widget? button}) {
  //   display(
  //       context: NavigationService.instance.context,
  //       message: message ?? MyText.operationIsSuccess,
  //       positive: positive,
  //       showSuccessIcon: showSuccessIcon);
  // }
  //
  // static error(
  //     {BuildContext? context,
  //     String? message,
  //     bool positive = false,
  //     bool showSuccessIcon = false,
  //     bool ignorePointer = false,
  //     bool onTop = false,
  //     Duration duration = Durations.s4,
  //     double textSize = 16.0,
  //     Widget? button}) {
  //   display(
  //       context: NavigationService.instance.context,
  //       message: message ?? MyText.error,
  //       positive: positive,
  //       showSuccessIcon: showSuccessIcon);
  // }

  static bool isShowing = false;

  static showOverlay(BuildContext context,
      {required String message,
      Duration? duration,
      Color? color,
      bool? positive = false,
      bool showSuccessIcon = false,
      double? radius}) async {
    //values

    Color backColor = color ?? MyColors.brand;
    Duration settedDuration = duration ?? Durations.s5;
    BorderRadius borderRadius = BorderRadius.circular(radius ?? 10);
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      // You can return any widget you like here
      // to be displayed on the Overlay

      return Positioned(
        // left: MediaQuery.of(context).size.width * 0.2,
        top: 45,
        left: 0,
        right: 0,
        child: FadeInDown(
          duration: Durations.ms200,
          key: const Key('a'),
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
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          //color: MyColors.mainColor,
                          color: (positive!) ? color : MyColors.brand,
                          // gradient: (positive??false) ? Gradients.gBlues : Gradients.gReds,
                          borderRadius: BorderRadius.circular(10)),
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
                                right:
                                    (!positive || showSuccessIcon) ? 40 : 16),
                            child: Center(
                              child: Text(
                                message
                                //?? 'error_during_operation'
                                ,
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
                                  child: Container(
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
                    ),
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
      overlayState?.insert(overlayEntry);
      isShowing = true;
      await Future.delayed(settedDuration + Durations.s1);

      overlayEntry.remove();
      isShowing = false;
    } else {
      isShowing = false;
      overlayState?.insert(overlayEntry);
      isShowing = true;
      await Future.delayed(settedDuration + Durations.s1);

      overlayEntry.remove();
      isShowing = false;
    }
  }
}
