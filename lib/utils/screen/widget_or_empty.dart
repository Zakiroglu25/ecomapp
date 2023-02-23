import 'package:flutter/material.dart';

class WidgetOrEmpty extends StatelessWidget {
  final bool? value;
  final Widget? child;
  final Widget elseChild;

  WidgetOrEmpty(
      {required this.value,
      required this.child,
      this.elseChild = const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    if (value ?? false) {
      return child ?? elseChild;
    }
    return elseChild;
  }
}
