import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../util/constants/assets.dart';
import '../../util/constants/colors.dart';
import '../../util/screen/widget_or_empty.dart';

class DoctoroLoading extends StatelessWidget {
  Color? color;
  double? s;

  DoctoroLoading({this.color,this.s});

  DoctoroLoading.blue({this.color = MyColors.mainGrey});

  DoctoroLoading.white({this.color = MyColors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: s??null,
      width: s??null,
      child: Center(
          child: FadeIn(
            duration: Duration(milliseconds: 800),
            child: WidgetOrEmpty(
              value: color==null,
              elseChild: Container(width: 20,height: 20,child: CircularProgressIndicator(color: color,)),
              child: Container(
                height: 25,
                width: 25,
                // color: Colors.green,
                child: Lottie.asset(Assets.loading,width: 2),
              ),
            ),
          )),
    );
  }
}
