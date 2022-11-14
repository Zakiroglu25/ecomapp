import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/screen/widget_or_empty.dart';

class AppLoading extends StatelessWidget {
  Color? color;
  double? s;

  AppLoading({this.color, this.s});

  AppLoading.blue({this.color = MyColors.mainGrey});

  AppLoading.white({this.color = MyColors.white, this.s});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingA2,
      child: SizedBox(
        height: s,
        width: s,
        child: Center(
            child: FadeIn(
          duration: Duration(milliseconds: 800),
          child: WidgetOrEmpty(
            value: color == null,
            elseChild: CircularProgressIndicator(
              color: color,
            ),
            child: Container(
              height: s,
              width: s,
              // color: Colors.green,
              child: Lottie.asset(Assets.loading, width: 1),
            ),
          ),
        )),
      ),
    );
  }
}
