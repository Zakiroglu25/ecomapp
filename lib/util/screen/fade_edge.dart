// Flutter imports:
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FadeEdge extends StatelessWidget {
  final Widget? child;
  final Widget? bottomButton;

  FadeEdge({@required this.child, this.bottomButton});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child!,
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   child: Container(
        //     height: 35,
        //     decoration: new BoxDecoration(
        //       gradient: new LinearGradient(
        //         colors: [
        //           //MyColors.white,
        //           //  MyColors.white,
        //           MyColors.white.withOpacity(0.9),
        //           MyColors.white.withOpacity(0.8),
        //           MyColors.white.withOpacity(0.7),
        //           MyColors.white.withOpacity(0.6),
        //           MyColors.white.withOpacity(0.5),
        //           MyColors.white.withOpacity(0.4),
        //           MyColors.white.withOpacity(0.3),
        //           MyColors.white.withOpacity(0.2),
        //           MyColors.white.withOpacity(0.1),
        //           MyColors.white.withOpacity(0.0),
        //         ],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: 50,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    MyColors.white,
                    MyColors.white,
                    MyColors.white.withOpacity(0.9),
                    MyColors.white.withOpacity(0.7),
                    MyColors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // stops: [0.0, 1.0],
                  // tileMode: TileMode.clamp
                ),
              ),
            ),
          ),
        ),
        bottomButton ?? Container()
      ],
    );
  }
}
