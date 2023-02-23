import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../constants/colors.dart';
import '../constants/durations.dart';
import '../constants/paddings.dart';

class AppOverlay {
  static bool isShowing = false;
  static showoverlay(BuildContext context,
      {required String message,
      Duration? duration,
      Color? color,
      double? radius}) async {
//values
    Color backColor = color ?? MyColors.errorRED;
    Duration settedDuration = duration ?? Durations.s3;
    BorderRadius borderRadius = BorderRadius.circular(radius ?? 10);
// Declaring and Initializing OverlayState
// and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: FadeInDown(
              duration: Durations.ms200,
              key: const Key('value'),
              child: FadeOutUp(
                  duration: Durations.ms300,
                  key: const Key('value'),
                  animate: true,
                  delay: settedDuration,
                  child: Center(
                    child: Container(
                      width: context.sW,
                      margin: Paddings.paddingA16,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius, color: backColor),
                      child: Material(
                        color: backColor,
                        borderRadius: borderRadius,
                        elevation: 2,
                        child: Center(
                            child: Container(
                          margin: Paddings.paddingA16,
                          decoration: BoxDecoration(borderRadius: borderRadius),
                          padding: Paddings.paddingA16 + Paddings.paddingV4,
                          child: Text(
                            message,
                            style: AppTextStyles.sfPro500s13,
                          ),
                        )),
                      ),
                    ),
                  ))));
    });

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

  static void show(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    OverlayEntry overlay2;
    OverlayEntry overlay3;
    overlayEntry = overlayEntryK();
    // overlay2 = OverlayEntry(builder: (context) {
    //   return Positioned(
    //     left: MediaQuery.of(context).size.width * 0.1,
    //     top: MediaQuery.of(context).size.height * 0.5,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(20),
    //       child: Container(
    //         padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
    //         width: MediaQuery.of(context).size.width * 0.8,
    //         height: MediaQuery.of(context).size.height * 0.11,
    //         color: Colors.pink.withOpacity(0.5),
    //         child: Material(
    //           color: Colors.transparent,
    //           child: Text('decades of industry experience under a single roof,',
    //               style: TextStyle(
    //                   fontSize: MediaQuery.of(context).size.height * 0.03,
    //                   //fontWeight: FontWeight.bold,
    //                   color: Colors.white)),
    //         ),
    //       ),
    //     ),
    //   );
    // });
    // overlay3 = OverlayEntry(builder: (context) {
    //   return Positioned(
    //     left: MediaQuery.of(context).size.width * 0.1,
    //     top: MediaQuery.of(context).size.height * 0.7,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(20),
    //       child: Container(
    //         padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
    //         width: MediaQuery.of(context).size.width * 0.8,
    //         height: MediaQuery.of(context).size.height * 0.11,
    //         color: Colors.blue.withOpacity(0.5),
    //         child: Material(
    //           color: Colors.transparent,
    //           child: Text('and this empowers us to serve you with excellence.',
    //               style: TextStyle(
    //                   fontSize: MediaQuery.of(context).size.height * 0.03,
    //                   //fontWeight: FontWeight.bold,
    //                   color: Colors.white)),
    //         ),
    //       ),
    //     ),
    //   );
    // });

    Overlay.of(context)?.insert(overlayEntry);
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => overlayState?.insertAll([overlayEntry]));

    await Future.delayed(const Duration(seconds: 2));

    overlayEntry.remove();
    overlayEntry = null;

    //Overlay.of(context).insert(overlayEntry));

    // await Future.delayed(const Duration(seconds: 1));
    //
    // overlay2.remove();
    //
    // await Future.delayed(const Duration(seconds: 1));
    //
    // overlay3.remove();
  }

  static OverlayEntry overlayEntryK() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.orange.withOpacity(0.5),
            child: Material(
              color: Colors.transparent,
              child: Text('The Flutter app developers at FlutterDevs have',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });
  }
}

class OverlayDemo extends StatefulWidget {
  const OverlayDemo({Key? key}) : super(key: key);

  @override
  _OverlayDemoState createState() => _OverlayDemoState();
}

class _OverlayDemoState extends State<OverlayDemo> {
  void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlay1;
    OverlayEntry overlay2;
    OverlayEntry overlay3;
    overlay1 = OverlayEntry(builder: (context) {
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.orange.withOpacity(0.5),
            child: Material(
              color: Colors.transparent,
              child: Text('The Flutter app developers at FlutterDevs have',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });
    overlay2 = OverlayEntry(builder: (context) {
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.pink.withOpacity(0.5),
            child: Material(
              color: Colors.transparent,
              child: Text('decades of industry experience under a single roof,',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });
    overlay3 = OverlayEntry(builder: (context) {
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.blue.withOpacity(0.5),
            child: Material(
              color: Colors.transparent,
              child: Text('and this empowers us to serve you with excellence.',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });

    overlayState?.insertAll([overlay1, overlay2, overlay3]);

    await Future.delayed(const Duration(seconds: 2));

    overlay1.remove();

    await Future.delayed(const Duration(seconds: 1));

    overlay2.remove();

    await Future.delayed(const Duration(seconds: 1));

    overlay3.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          'Flutter Overlay Demo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 300,
            width: 350,
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            color: Colors.pink[300],
            minWidth: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.06,
            child: const Text(
              'show Overlay',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onPressed: () {
              _showOverlay(context);
            },
          ),
        ],
      ))),
    );
  }
}

class AppDialogs {
  static final AppDialogs _instance = AppDialogs.internal();

  AppDialogs.internal();

  factory AppDialogs() => _instance;

  static void appToast(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Icon? toastIcon,
    Color? toastColor,
    double? height,
    double? width,
    bool dismissibleToast = true,
  }) async {
    final OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (content) => Positioned(
          height: height ?? 80,
          width: width ?? 200,
          top: 0,
          right: 0,
          child: Card(
              borderOnForeground: true,
              elevation: 10,
              child: Stack(
                children: [
                  ListTile(
                    tileColor: toastColor,
                    title: title,
                    subtitle: description,
                    leading: toastIcon,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => closeOverlay(overlayEntry),
                        child: const Icon(
                          Icons.close,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
    // overlayState?.insert(overlayEntry);
    // final overlay = Overlay.of(context);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlayState?.insert(overlayEntry));
  }

  static void closeOverlay(OverlayEntry overlayEntry) {
    {
      overlayEntry.remove();
    }
  }
}
