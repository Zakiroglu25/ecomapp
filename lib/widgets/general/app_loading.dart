import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/screen/widget_or_empty.dart';

class AppLoading extends StatelessWidget {
  final Color? color;
  final double? s;

  const AppLoading({Key? key, this.color, this.s = 120});

  const AppLoading.blue(
      {Key? key, this.color = MyColors.mainGrey, this.s = 120})
      : super(key: key);

  const AppLoading.green(
      {Key? key, this.color = MyColors.btnGreen, this.s = 120})
      : super(key: key);

  // const AppLoading.main({this.color = MyColors.main, this.s = 120});

  // const AppLoading.big({this.color = MyColors.main, this.s = 120});

  const AppLoading.white({this.color = MyColors.white, this.s = 120});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Paddings.paddingA2,
        child: SizedBox(
          height: s,
          width: s,
          child: Center(
              child: FadeIn(
            duration: const Duration(milliseconds: 800),
            child: WidgetOrEmpty(
              value: color == null,
              elseChild: CircularProgressIndicator(
                // color: color,
                valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? MyColors.mainGreen85),
              ),
              child: SizedBox(
                height: s,
                width: s,
                // color: Colors.green,
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      color ?? MyColors.mainGreen85),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
