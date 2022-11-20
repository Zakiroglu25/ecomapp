import 'package:flutter/material.dart';

import '../../utils/constants/durations.dart';

class CustomAnimatedCross extends StatelessWidget {
  const CustomAnimatedCross(
      {Key? key,
      this.showFirst = true,
      this.duration = Durations.ms100,
      required this.first,
      required this.second})
      : super(key: key);
  final bool showFirst;
  final Widget first;
  final Widget second;
  final Duration duration;
//
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: first,
      duration: duration,
      secondChild: second,
    );
  }
}
