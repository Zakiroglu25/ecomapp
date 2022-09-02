import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/screen/widget_or_empty.dart';

class AppLoading extends StatelessWidget {
  Color? color;
  double? s;

  AppLoading({this.color, this.s});

  AppLoading.blue({this.color = MyColors.mainGrey});

  AppLoading.white({this.color = MyColors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: s ?? null,
      width: s ?? null,
      child: Center(
          child: FadeIn(
        duration: Duration(milliseconds: 800),
        child: WidgetOrEmpty(
          value: color == null,
          elseChild: Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: color,
              )),
          child: Container(
            height: 25,
            width: 25,
            // color: Colors.green,
            child: Lottie.asset(Assets.loading, width: 2),
          ),
        ),
      )),
    );
  }
}
