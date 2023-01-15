import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/durations.dart';

class CustomAnimatedSize extends StatelessWidget {
  const CustomAnimatedSize({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(duration: Durations.ms300, child: child);
  }
}
